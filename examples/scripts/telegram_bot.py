#!/usr/bin/env python3
"""
Athena Telegram Interface (Bankai Module A)
Bridges Telegram inputs (Text, Voice, Image) to Athena's core scripts.
"""

import logging
import os
import sys
import tempfile
from pathlib import Path
from dotenv import load_dotenv

from telegram import Update
from telegram.ext import ApplicationBuilder, ContextTypes, CommandHandler, MessageHandler, filters

# Import Athena capabilities
sys.path.insert(0, str(Path(__file__).parent))
from analyze_image import analyze_image
from transcribe_audio import transcribe_audio
from browser_agent import google_search, browse_url
# from calendar_agent import list_events, quick_add
from gemini_client import GeminiClient, get_mobile_system_prompt
from sqlite_memory import save_message, load_history, clear_user_history
import requests
import chromadb

# ATHENA_CLIENT removed from global to allow per-user persistent sessions.
# ATHENA_CLIENT = GeminiClient(system_prompt=get_mobile_system_prompt())
# print(f"✅ Athena Online. [Model: {ATHENA_CLIENT.model_name}]")

# Session State (for /start → /end paradigm)
SESSION_ACTIVE = False
SESSION_LOG = []  # List of (timestamp, role, message) tuples

def get_timestamp():
    from datetime import datetime
    return datetime.now().strftime("%H:%M")

# Load Environment
load_dotenv()
TOKEN = os.getenv("TELEGRAM_BOT_TOKEN")
ALLOWED_USER_ID = os.getenv("TELEGRAM_ALLOWED_USER_ID")

# Logging Setup
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger(__name__)

# RAG Configuration
CHROMA_HOST = "localhost"
CHROMA_PORT = 8001
COLLECTION_NAME = "athena_gemini_kb"
GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")

def get_gemini_embedding(text):
    url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent?key={GOOGLE_API_KEY}"
    payload = {"model": "models/gemini-embedding-001", "content": {"parts": [{"text": text}]}}
    try:
        response = requests.post(url, json=payload, timeout=10)
        response.raise_for_status()
        return response.json()["embedding"]["values"]
    except Exception as e:
        logger.error(f"Embedding error: {e}")
        return None

def query_athena_kb(query_text, n_results=3):
    try:
        client = chromadb.HttpClient(host=CHROMA_HOST, port=CHROMA_PORT)
        collection = client.get_collection(name=COLLECTION_NAME)
        query_emb = get_gemini_embedding(query_text)
        if not query_emb: return ""
        
        results = collection.query(query_embeddings=[query_emb], n_results=n_results)
        context = "\n\n[RETRIEVED CONTEXT]\n"
        for doc in results['documents'][0]:
            context += f"- {doc}\n"
        return context
    except Exception as e:
        logger.error(f"RAG query error: {e}")
        return ""

def md_to_html(text: str) -> str:
    """Convert common Markdown patterns to Telegram HTML."""
    import re
    
    # Nested bullet points: 4 spaces + * → ↳ (sub-bullet)
    text = re.sub(r'^(\s{4,})[\*\-]\s+', r'\1↳ ', text, flags=re.MULTILINE)
    
    # First-level bullets: * text or - text → • text
    text = re.sub(r'^[\*\-]\s+', '• ', text, flags=re.MULTILINE)
    
    # Numbered lists: 1. text → 1️⃣ text (first 9)
    number_emojis = {'1': '1️⃣', '2': '2️⃣', '3': '3️⃣', '4': '4️⃣', '5': '5️⃣', 
                     '6': '6️⃣', '7': '7️⃣', '8': '8️⃣', '9': '9️⃣'}
    def replace_number(m):
        num = m.group(1)
        return number_emojis.get(num, f"{num}.") + " "
    text = re.sub(r'^(\d)\.\s+', replace_number, text, flags=re.MULTILINE)
    
    # Headers: ### text → 📌 <b>text</b>
    text = re.sub(r'^#{1,6}\s*(.+)$', r'📌 <b>\1</b>', text, flags=re.MULTILINE)
    
    # Bold: **text** or __text__ -> <b>text</b>
    text = re.sub(r'\*\*(.+?)\*\*', r'<b>\1</b>', text)
    text = re.sub(r'__(.+?)__', r'<b>\1</b>', text)
    
    # Italic: *text* or _text_ -> <i>text</i> (after bold to avoid conflicts)
    text = re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<i>\1</i>', text)
    text = re.sub(r'(?<!_)_(?!_)(.+?)(?<!_)_(?!_)', r'<i>\1</i>', text)
    
    # Code: `text` -> <code>text</code>
    text = re.sub(r'`([^`]+)`', r'<code>\1</code>', text)
    
    return text

async def auth_check(update: Update) -> bool:
    """Ensure only the owner drives the EVA unit."""
    if not ALLOWED_USER_ID:
        # If no ID set, warn but maybe allow (unsafe mode) or block. 
        # Better to block.
        await update.message.reply_text("⛔ Security Protocol: TELEGRAM_ALLOWED_USER_ID not configured.")
        return False
    
    user_id = str(update.effective_user.id)
    print(f"📡 Incoming Signal from ID: {user_id} (Expected: {ALLOWED_USER_ID})") # DEBUG LINE
    
    if user_id != ALLOWED_USER_ID:
        logger.warning(f"Unauthorized access attempt from ID: {user_id}")
        await update.message.reply_text(f"⛔ Access Denied. Your ID: {user_id}")
        return False
    return True

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    global SESSION_ACTIVE, SESSION_LOG
    if not await auth_check(update): return
    
    # Reset session
    SESSION_ACTIVE = True
    SESSION_LOG = []
    
    # Clear persistent history if user starts fresh
    user_id = str(update.effective_user.id)
    clear_user_history(user_id)
    
    await update.message.reply_text("⚡ Session Started.\n\nChat freely — everything is logged and persisted to SQLite.\n\nType /end when done.")

async def handle_text(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Conversational handler - chat with Athena via Gemini."""
    global SESSION_LOG
    if not await auth_check(update): return
    
    # Check if session is active
    if not SESSION_ACTIVE:
        await update.message.reply_text("💤 No active session. Type /start to begin.")
        return
    
    text = update.message.text
    user_id = str(update.effective_user.id)
    
    # Log user message to session log (for /end summary)
    SESSION_LOG.append((get_timestamp(), "User", text))
    
    # Save to SQLite Persistent Memory
    save_message(user_id, "user", text)
    
    try:
        # Load persistent history for this user
        past_history = load_history(user_id)
        
        # Initialize user-specific client with history
        client = GeminiClient(
            system_prompt=get_mobile_system_prompt(),
            initial_history=past_history
        )
        
        # Send to Gemini with RAG Context
        rag_context = query_athena_kb(text)
        prompt_with_rag = text
        if rag_context:
            prompt_with_rag = f"{text}\n\n{rag_context}"
            logger.info("Injected RAG context into prompt")

        response = client.chat(prompt_with_rag)
        
        # Save Athena response to SQLite Persistent Memory
        save_message(user_id, "model", response)
        
        # Log Athena response
        SESSION_LOG.append((get_timestamp(), "Athena", response[:500]))
        
        # Clean response of raw [RETRIEVED CONTEXT] markers if LLM leaked them
        response = response.split("[RETRIEVED CONTEXT]")[0].strip()
        
        # Truncate if needed (Telegram limit 4096)
        if len(response) > 4000:
            response = response[:4000] + "\n\n[...truncated]"
        
        # Convert MD to HTML
        response = md_to_html(response)
            
        await update.message.reply_text(response, parse_mode="HTML")
        
    except Exception as e:
        logger.error(f"Gemini error: {e}")
        await update.message.reply_text(f"❌ Brain Error: {str(e)}")

async def handle_end(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """End session: Summarize, save to session log, git push."""
    global SESSION_ACTIVE, SESSION_LOG
    if not await auth_check(update): return
    
    if not SESSION_ACTIVE:
        await update.message.reply_text("💤 No active session to end.")
        return
    
    if not SESSION_LOG:
        await update.message.reply_text("📭 Session is empty — nothing to save.")
        SESSION_ACTIVE = False
        return
    
    await update.message.reply_text(f"📝 Ending session... ({len(SESSION_LOG)} exchanges)")
    
    try:
        # Format full log with content
        log_text = f"\n### 📱 Telegram Session [{get_timestamp()}]\n\n"
        for ts, role, msg in SESSION_LOG:
            # Truncate long messages but keep more content
            preview = msg[:400] if len(msg) > 400 else msg
            log_text += f"**[{ts}] {role}:** {preview}{'...' if len(msg) > 400 else ''}\n\n"
        
        # Append directly to session log file
        import subprocess
        from datetime import datetime
        workspace = Path(__file__).parent.parent.parent
        
        # Find latest session log
        session_dir = workspace / ".context" / "memories" / "session_logs"
        today = datetime.now().strftime("%Y-%m-%d")
        session_files = sorted(session_dir.glob(f"{today}-session-*.md"), reverse=True)
        
        if session_files:
            session_file = session_files[0]
            with open(session_file, "a") as f:
                f.write(log_text)
            logger.info(f"Appended to {session_file}")
        else:
            # Fallback to quicksave
            subprocess.run(
                ["python3", ".agent/scripts/quicksave.py", log_text[:500]],
                cwd=workspace
            )
        
        # Git commit (local only)
        subprocess.run(["git", "add", "-A"], cwd=workspace)
        result = subprocess.run(
            ["git", "commit", "-m", f"sync(telegram): {len(SESSION_LOG)} exchanges from mobile"],
            cwd=workspace,
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0 or "nothing to commit" in result.stdout:
            await update.message.reply_text(f"✅ Synced {len(SESSION_LOG)} exchanges locally. (Push requires explicit approval)\n\nSession closed.")
        else:
            await update.message.reply_text(f"⚠️ Logged locally but commit failed: {result.stderr[:200]}")
        
        # Reset
        SESSION_ACTIVE = False
        SESSION_LOG = []
        ATHENA_CLIENT.clear_history()
        
    except Exception as e:
        logger.error(f"End session error: {e}")
        await update.message.reply_text(f"❌ Error: {str(e)}")

async def handle_log(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Explicit note-saving without Gemini response."""
    if not await auth_check(update): return
    
    text = " ".join(context.args)
    if not text:
        await update.message.reply_text("❌ Usage: /log <your note>")
        return
    
    try:
        import subprocess
        subprocess.run(
            ["python3", ".agent/scripts/quicksave.py", f"Telegram Note: {text}"],
            cwd=Path(__file__).parent.parent.parent
        )
        await update.message.reply_text("✅ Logged.")
    except Exception as e:
        await update.message.reply_text(f"❌ Error: {str(e)}")

async def handle_clear(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Reset conversation history."""
    if not await auth_check(update): return
    
    ATHENA_CLIENT.clear_history()
    await update.message.reply_text("🧹 Conversation cleared. Fresh start.")

async def handle_voice(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    await update.message.reply_text("🎤 Receiving Transmission...")
    
    # Download file
    voice_file = await update.message.voice.get_file()
    
    with tempfile.NamedTemporaryFile(suffix=".ogg", delete=False) as f:
        await voice_file.download_to_drive(f.name)
        temp_path = Path(f.name)
        
    try:
        # Transcribe
        await update.message.reply_text("🧠 Decoding Audio...")
        result = transcribe_audio(temp_path, summarize=True)
        
        transcript = result.get("transcript", "")
        summary = result.get("summary", "")
        
        response_text = f"**Transcript**:\n{transcript[:500]}..."
        if summary:
            response_text += f"\n\n**Summary**:\n{summary}"
            
        await update.message.reply_text(response_text)
        
        # Quicksave the summary
        save_text = f"Voice Note Summary: {summary}" if summary else f"Voice Note: {transcript[:100]}..."
        import subprocess
        subprocess.run(
            ["python3", ".agent/scripts/quicksave.py", save_text],
            cwd=Path(__file__).parent.parent.parent
        )
        await update.message.reply_text("✅ Logged.")

    except Exception as e:
        logger.error(f"Voice error: {e}")
        await update.message.reply_text(f"❌ Decoding Failed: {str(e)}")
    finally:
        if temp_path.exists():
            os.unlink(temp_path)

async def handle_photo(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    await update.message.reply_text("👁️ Analyzing Visual...")
    
    # Get highest resolution photo
    photo_file = await update.message.photo[-1].get_file()
    
    with tempfile.NamedTemporaryFile(suffix=".jpg", delete=False) as f:
        await photo_file.download_to_drive(f.name)
        temp_path = Path(f.name)
        
    try:
        # Analyze
        analysis = analyze_image(temp_path, mode="general")
        
        await update.message.reply_text(f"**Analysis**:\n{analysis[:3000]}") # Telegram limit 4096
        
        # Quicksave
        import subprocess
        subprocess.run(
            ["python3", ".agent/scripts/quicksave.py", f"Analyzed Image: {analysis[:100]}..."],
            cwd=Path(__file__).parent.parent.parent
        )
        await update.message.reply_text("✅ Logged.")
        
    except Exception as e:
        logger.error(f"Image error: {e}")
        await update.message.reply_text(f"❌ Analysis Failed: {str(e)}")
    finally:
        if temp_path.exists():
            os.unlink(temp_path)

async def handle_search(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    query = " ".join(context.args)
    if not query:
        await update.message.reply_text("❌ Usage: /search <query>")
        return

    await update.message.reply_text(f"🔍 Searching: {query}...")
    
    try:
        results = await google_search(query)
        if not results:
            await update.message.reply_text("❌ No results found.")
            return
            
        response = "**Search Results:**\n\n"
        for r in results:
            title = r.get('title', 'No Title')
            url = r.get('url', '#')
            snippet = r.get('snippet', '')
            response += f"🔗 [{title}]({url})\n{snippet}\n\n"
            
        await update.message.reply_text(response, parse_mode="Markdown")
        
    except Exception as e:
        logger.error(f"Search error: {e}")
        await update.message.reply_text(f"❌ Error: {str(e)}")

async def handle_browse(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    url = context.args[0] if context.args else ""
    if not url:
        await update.message.reply_text("❌ Usage: /browse <url>")
        return

    await update.message.reply_text(f"🕸️ Browsing: {url}...")
    
    try:
        content = await browse_url(url)
        preview = content[:3000]
        await update.message.reply_text(f"**Page Content**:\n\n{preview}...", parse_mode="Markdown")
        
        import subprocess
        subprocess.run(
            ["python3", ".agent/scripts/quicksave.py", f"Visited: {url}"],
            cwd=Path(__file__).parent.parent.parent
        )

    except Exception as e:
        logger.error(f"Browse error: {e}")
        await update.message.reply_text(f"❌ Error: {str(e)}")

async def handle_schedule(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    text = " ".join(context.args)
    if not text:
        await update.message.reply_text("❌ Usage: /schedule <natural language event>")
        return

    await update.message.reply_text(f"🗓️ Scheduling: \"{text}\"...")
    
    try:
        result = quick_add(text)
        await update.message.reply_text(f"✅ {result}")
    except Exception as e:
        logger.error(f"Schedule error: {e}")
        await update.message.reply_text(f"❌ Error: {str(e)}")

async def handle_save(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Dynamic RAG ingestion: /save <category> <content>"""
    if not await auth_check(update): return
    
    if len(context.args) < 2:
        await update.message.reply_text("❌ Usage: /save <category> <your content>")
        return
        
    category = context.args[0]
    content = " ".join(context.args[1:])
    
    await update.message.reply_text(f"🧠 Embedding memory in category '{category}'...")
    
    try:
        embedding = get_gemini_embedding(content)
        if not embedding:
            raise Exception("Failed to generate embedding")
            
        client = chromadb.HttpClient(host=CHROMA_HOST, port=CHROMA_PORT)
        collection = client.get_or_create_collection(name=COLLECTION_NAME)
        
        # Generate unique ID based on content
        import hashlib
        mem_id = f"telegram_{hashlib.md5(content.encode()).hexdigest()[:12]}"
        
        collection.upsert(
            ids=[mem_id],
            embeddings=[embedding],
            documents=[content],
            metadatas=[{"category": category, "source": "telegram", "timestamp": get_timestamp()}]
        )
        
        await update.message.reply_text(f"✅ Memory saved to {category}. I'll remember this.")
        
    except Exception as e:
        logger.error(f"Save error: {e}")
        await update.message.reply_text(f"❌ Failed to save memory: {str(e)}")

async def handle_events(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if not await auth_check(update): return
    
    await update.message.reply_text("🗓️ Fetching Agenda...")
    
    try:
        events = list_events(5)
        response = "**Upcoming Events**:\n\n" + "\n".join(events)
        await update.message.reply_text(response)
    except Exception as e:
        logger.error(f"Event list error: {e}")
        await update.message.reply_text(f"❌ Error: {str(e)}")

if __name__ == '__main__':
    if not TOKEN:
        print("❌ Error: TELEGRAM_BOT_TOKEN not found in .env")
        sys.exit(1)
        
    application = ApplicationBuilder().token(TOKEN).build()
    
    application.add_handler(CommandHandler('start', start))
    application.add_handler(CommandHandler('end', handle_end))
    application.add_handler(CommandHandler('log', handle_log))
    application.add_handler(CommandHandler('search', handle_search))
    application.add_handler(CommandHandler('browse', handle_browse))
    application.add_handler(CommandHandler('schedule', handle_schedule))
    application.add_handler(CommandHandler('save', handle_save))
    application.add_handler(CommandHandler('events', handle_events))
    application.add_handler(MessageHandler(filters.TEXT & (~filters.COMMAND), handle_text))
    application.add_handler(MessageHandler(filters.VOICE, handle_voice))
    application.add_handler(MessageHandler(filters.PHOTO, handle_photo))
    
    print("🤖 Athena Interface Listening...")
    application.run_polling()
