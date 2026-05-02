#!/usr/bin/env python3
"""
Audio transcription module for Athena.
"""

import google.generativeai as genai
from pathlib import Path
from gemini_client import get_client

def transcribe_audio(audio_path: str, summarize: bool = True) -> dict:
    """Transcribe audio and optionally summarize it using Gemini."""
    client = get_client()
    try:
        audio_file = genai.upload_file(path=str(audio_path))
        
        prompt = "Please transcribe this audio exactly. Do not add any extra commentary, just the transcription."
        transcript_response = client.model.generate_content([prompt, audio_file])
        transcript = transcript_response.text
        
        summary = ""
        if summarize:
            summary_prompt = f"Please summarize this transcript briefly:\n{transcript}"
            summary_response = client.model.generate_content(summary_prompt)
            summary = summary_response.text
            
        # Cleanup
        try:
            genai.delete_file(audio_file.name)
        except Exception:
            pass
            
        return {
            "transcript": transcript,
            "summary": summary
        }
    except Exception as e:
        return {
            "transcript": f"Error during transcription: {str(e)}",
            "summary": ""
        }
