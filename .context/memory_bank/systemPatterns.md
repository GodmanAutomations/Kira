# System Patterns

## Architecture & Code Conventions

### Vector Storage (Supabase)
*   **Embeddings:** All embeddings utilize `gemini-embedding-001` yielding 3072 dimensions.
*   **Index Strategy:** Due to Postgres `vector` limits (max 2000 dims for HNSW), all 3072d vectors must be cast to `halfvec(3072)` when building similarity indexes.
    *   *Example:* `USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)`
*   **Sync Logic:** Handled via `.agent/scripts/supabase_sync.py` utilizing parallel execution with strict 1-thread rate limiting to prevent API bans. Requires `ON CONFLICT` constraints (e.g. `file_path UNIQUE`).

### Agent Interaction
*   **Execution:** All complex processes must be "Drop Box" routed—intent via `/tasks`, execution output via `/truth_logs`.
*   **Python Stack:** Rely heavily on standard virtual environments (`.venv`), `python3 -m athena`, and `psycopg2` / `supabase-py` for memory interaction.

### GCP Rules (gen-lang-client-0567227571)
*   **No Hallucinations:** Never invent GCP bucket names or BigQuery tables. Always query existing architecture files (`~/.gcp_architecture.md`) first.
*   **Retries:** All GCP and LLM calls must implement exponential backoff.
