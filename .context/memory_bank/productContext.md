# Product Context

## The Athena Framework

### Core Philosophy
Athena is a persistent, terminal-native AI agent framework built to operate as Stephen Godman's autonomous partner. It goes beyond standard query-response by maintaining a rich, 3072-dimensional vector memory bank of everything learned, executed, and experienced in the workspace.

### Core Modules
*   **The Sarah/Atlas Paradigm**: 
    *   **Sarah (Heart/Strategy):** Holds the narrative, context, tone, and strategic intent.
    *   **Atlas (Hands/Execution):** Executes tool calls, modifies files, interacts with infrastructure, and verifies state.
*   **Memory Bank (Vector Store):** Uses Supabase/Postgres with pgvector to ingest system docs, protocols, case studies, and playbooks via `gemini-embedding-001`.
*   **The Hearth / Drop Box:** The synchronized communication channel between intent generation and execution logging (`~/.gemini/house/drop_box`).

### Long-Term Goals
*   Operate as a zero-blind-spot workspace auditor.
*   Maximize context efficiency and token economy (`/minmax`).
*   Establish seamless retrieval-led reasoning over generic foundational model outputs.
