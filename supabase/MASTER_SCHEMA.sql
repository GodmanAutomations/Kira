-- ==============================================================================
-- ATHENA v8.1 MASTER SCHEMA (CONSOLIDATED)
-- ==============================================================================
-- Single source of truth for all Supabase tables, search functions, and triggers.
--
-- STATUS: PRODUCTION (2026-02-12)
-- ARCHITECTURE:
--   - Storage: Postgres Tables + JSONB Metadata
--   - Vector:  text-embedding-3-large (3072 dims)
--   - Index:   HNSW (Approximate Nearest Neighbor)
--   - Automation: Auto-Tagging Triggers (on Insert/Update)
--
-- USAGE:
--   1. Open Supabase SQL Editor
--   2. Enable pgvector: Extensions → pgvector → Enable
--   3. Paste and run this entire file
-- ==============================================================================
-- Enable pgvector extension for embeddings
CREATE EXTENSION IF NOT EXISTS vector;
-- ==============================================================================
-- CORE TABLES
-- ==============================================================================
-- -----------------------------------------------------------------------------
-- TABLE: sessions
-- Stores session logs with embeddings
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date DATE NOT NULL,
    session_number INTEGER NOT NULL,
    title TEXT,
    content TEXT NOT NULL,
    summary TEXT,
    embedding vector(3072),
    file_path TEXT UNIQUE,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
-- sessions: vector similarity index
CREATE INDEX IF NOT EXISTS idx_sessions_embedding
ON sessions
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

CREATE INDEX IF NOT EXISTS idx_sessions_date ON sessions(date DESC);
-- -----------------------------------------------------------------------------
-- TABLE: case_studies
-- Stores case studies with embeddings
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS case_studies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
-- case_studies: vector similarity index
CREATE INDEX IF NOT EXISTS idx_case_studies_embedding
ON case_studies
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

CREATE INDEX IF NOT EXISTS idx_case_studies_code ON case_studies(code);
-- -----------------------------------------------------------------------------
-- TABLE: protocols
-- Stores reusable thinking patterns
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS protocols (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    category TEXT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
-- protocols: vector similarity index
CREATE INDEX IF NOT EXISTS idx_protocols_embedding
ON protocols
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

CREATE INDEX IF NOT EXISTS idx_protocols_code ON protocols(code);
CREATE INDEX IF NOT EXISTS idx_protocols_category ON protocols(category);
-- -----------------------------------------------------------------------------
-- TABLE: capabilities
-- Stores tool/capability definitions
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS capabilities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    title TEXT,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- capabilities: vector similarity index
CREATE INDEX IF NOT EXISTS idx_capabilities_embedding
ON capabilities
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);
-- -----------------------------------------------------------------------------
-- TABLE: playbooks
-- Stores operational playbooks
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS playbooks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    title TEXT,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- playbooks: vector similarity index
CREATE INDEX IF NOT EXISTS idx_playbooks_embedding
ON playbooks
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);
-- -----------------------------------------------------------------------------
-- TABLE: references
-- Stores reference documents
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS "references" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    title TEXT,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- references: vector similarity index
CREATE INDEX IF NOT EXISTS idx_references_embedding
ON "references"
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);
-- -----------------------------------------------------------------------------
-- TABLE: frameworks
-- Stores framework documents
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS frameworks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    title TEXT,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- frameworks: vector similarity index
CREATE INDEX IF NOT EXISTS idx_frameworks_embedding
ON frameworks
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);
-- -----------------------------------------------------------------------------
-- TABLE: workflows
-- Stores workflow definitions
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS workflows (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    description TEXT,
    content TEXT NOT NULL,
    tags TEXT [],
    embedding vector(3072),
    file_path TEXT UNIQUE NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- workflows: vector similarity index
CREATE INDEX IF NOT EXISTS idx_workflows_embedding
ON workflows
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- -----------------------------------------------------------------------------
-- TABLE: user_profile
-- Stores user psychology, constraints, operating principles
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_profile (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    filename TEXT UNIQUE NOT NULL,
    title TEXT,
    category TEXT,
    content TEXT NOT NULL,
    file_path TEXT NOT NULL,
    embedding vector(3072),
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_user_profile_embedding
ON user_profile
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- -----------------------------------------------------------------------------
-- TABLE: system_docs
-- Stores system state, manifests, patterns
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS system_docs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    doc_type TEXT NOT NULL,
    filename TEXT UNIQUE NOT NULL,
    title TEXT,
    content TEXT NOT NULL,
    file_path TEXT UNIQUE NOT NULL,
    embedding vector(3072),
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_system_docs_embedding
ON system_docs
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- -----------------------------------------------------------------------------
-- TABLE: entities
-- Stores parsed entity data (people, groups, etc.)
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS entities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_name TEXT NOT NULL,
    entity_type TEXT,
    content TEXT NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    embedding vector(3072),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_entities_embedding
ON entities
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);

CREATE INDEX IF NOT EXISTS idx_entities_name ON entities(entity_name);

-- -----------------------------------------------------------------------------
-- TABLE: insights
-- Stores marketing analysis, strategic notes
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS insights (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    filename TEXT NOT NULL,
    title TEXT,
    content TEXT,
    file_path TEXT UNIQUE NOT NULL,
    embedding vector(3072),
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_insights_embedding
ON insights
USING hnsw ((embedding::halfvec(3072)) halfvec_cosine_ops)
WITH (m = 16, ef_construction = 64);
-- ==============================================================================
-- SEARCH FUNCTIONS (RPC)
-- ==============================================================================
-- Search sessions
CREATE OR REPLACE FUNCTION search_sessions(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        date DATE,
        title TEXT,
        summary TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT s.id,
    s.date,
    s.title,
    s.summary,
    s.metadata,
    1 - (s.embedding <=> query_embedding) AS similarity
FROM sessions s
WHERE s.embedding IS NOT NULL
    AND 1 - (s.embedding <=> query_embedding) > match_threshold
ORDER BY s.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search case_studies
CREATE OR REPLACE FUNCTION search_case_studies(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        code TEXT,
        title TEXT,
        tags TEXT [],
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT cs.id,
    cs.code,
    cs.title,
    cs.tags,
    cs.metadata,
    1 - (cs.embedding <=> query_embedding) AS similarity
FROM case_studies cs
WHERE cs.embedding IS NOT NULL
    AND 1 - (cs.embedding <=> query_embedding) > match_threshold
ORDER BY cs.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search protocols
CREATE OR REPLACE FUNCTION search_protocols(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        code TEXT,
        name TEXT,
        category TEXT,
        title TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT p.id,
    p.code,
    p.name,
    p.category,
    p.title,
    p.file_path,
    p.metadata,
    1 - (p.embedding <=> query_embedding) AS similarity
FROM protocols p
WHERE p.embedding IS NOT NULL
    AND 1 - (p.embedding <=> query_embedding) > match_threshold
ORDER BY p.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search capabilities
CREATE OR REPLACE FUNCTION search_capabilities(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        name TEXT,
        title TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT c.id,
    c.name,
    c.title,
    c.file_path,
    c.metadata,
    1 - (c.embedding <=> query_embedding) AS similarity
FROM capabilities c
WHERE c.embedding IS NOT NULL
    AND 1 - (c.embedding <=> query_embedding) > match_threshold
ORDER BY c.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search playbooks
CREATE OR REPLACE FUNCTION search_playbooks(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        name TEXT,
        title TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT p.id,
    p.name,
    p.title,
    p.file_path,
    p.metadata,
    1 - (p.embedding <=> query_embedding) AS similarity
FROM playbooks p
WHERE p.embedding IS NOT NULL
    AND 1 - (p.embedding <=> query_embedding) > match_threshold
ORDER BY p.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search references
CREATE OR REPLACE FUNCTION search_references(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        name TEXT,
        title TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT r.id,
    r.name,
    r.title,
    r.file_path,
    r.metadata,
    1 - (r.embedding <=> query_embedding) AS similarity
FROM "references" r
WHERE r.embedding IS NOT NULL
    AND 1 - (r.embedding <=> query_embedding) > match_threshold
ORDER BY r.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search frameworks
CREATE OR REPLACE FUNCTION search_frameworks(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        name TEXT,
        title TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT f.id,
    f.name,
    f.title,
    f.file_path,
    f.metadata,
    1 - (f.embedding <=> query_embedding) AS similarity
FROM frameworks f
WHERE f.embedding IS NOT NULL
    AND 1 - (f.embedding <=> query_embedding) > match_threshold
ORDER BY f.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- Search workflows
CREATE OR REPLACE FUNCTION search_workflows(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        name TEXT,
        description TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT w.id,
    w.name,
    w.description,
    w.file_path,
    w.metadata,
    1 - (w.embedding <=> query_embedding) AS similarity
FROM workflows w
WHERE w.embedding IS NOT NULL
    AND 1 - (w.embedding <=> query_embedding) > match_threshold
ORDER BY w.embedding <=> query_embedding
LIMIT match_count;
END;
$$;

-- Search user_profile
CREATE OR REPLACE FUNCTION search_user_profile(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        filename TEXT,
        title TEXT,
        category TEXT,
        content TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT up.id,
    up.filename,
    up.title,
    up.category,
    up.content,
    up.metadata,
    1 - (up.embedding <=> query_embedding) AS similarity
FROM user_profile up
WHERE up.embedding IS NOT NULL
    AND 1 - (up.embedding <=> query_embedding) > match_threshold
ORDER BY up.embedding <=> query_embedding
LIMIT match_count;
END;
$$;

-- Search system_docs
CREATE OR REPLACE FUNCTION search_system_docs(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        doc_type TEXT,
        filename TEXT,
        content TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT sd.id,
    sd.doc_type,
    sd.filename,
    sd.content,
    sd.metadata,
    1 - (sd.embedding <=> query_embedding) AS similarity
FROM system_docs sd
WHERE sd.embedding IS NOT NULL
    AND 1 - (sd.embedding <=> query_embedding) > match_threshold
ORDER BY sd.embedding <=> query_embedding
LIMIT match_count;
END;
$$;

-- Search entities
CREATE OR REPLACE FUNCTION search_entities(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 10
    ) RETURNS TABLE (
        id UUID,
        entity_name TEXT,
        entity_type TEXT,
        content TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT e.id,
    e.entity_name,
    e.entity_type,
    e.content,
    e.metadata,
    1 - (e.embedding <=> query_embedding) AS similarity
FROM entities e
WHERE e.embedding IS NOT NULL
    AND 1 - (e.embedding <=> query_embedding) > match_threshold
ORDER BY e.embedding <=> query_embedding
LIMIT match_count;
END;
$$;

-- Search insights
CREATE OR REPLACE FUNCTION search_insights(
        query_embedding vector(3072),
        match_threshold FLOAT DEFAULT 0.3,
        match_count INT DEFAULT 5
    ) RETURNS TABLE (
        id UUID,
        filename TEXT,
        title TEXT,
        content TEXT,
        file_path TEXT,
        metadata JSONB,
        similarity FLOAT
    ) LANGUAGE plpgsql AS $$ BEGIN RETURN QUERY
SELECT i.id,
    i.filename,
    i.title,
    i.content,
    i.file_path,
    i.metadata,
    1 - (i.embedding <=> query_embedding) AS similarity
FROM insights i
WHERE i.embedding IS NOT NULL
    AND 1 - (i.embedding <=> query_embedding) > match_threshold
ORDER BY i.embedding <=> query_embedding
LIMIT match_count;
END;
$$;
-- ==============================================================================
-- AUTOMATION TRIGGERS
-- ==============================================================================
-- 1. DEFINE TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION auto_enrich_metadata() RETURNS TRIGGER AS $$
DECLARE entity_name TEXT;
current_meta JSONB;
auto_tags JSONB;
BEGIN -- Identify source field (Name or Title)
IF (to_jsonb(NEW) ? 'name') THEN entity_name := NEW.name;
ELSIF (to_jsonb(NEW) ? 'title') THEN entity_name := NEW.title;
END IF;
-- Initialize Metadata
IF NEW.metadata IS NULL THEN NEW.metadata := '{}'::jsonb;
END IF;
current_meta := NEW.metadata;
-- Update 'auto_tags'
IF entity_name IS NOT NULL THEN NEW.metadata := current_meta || jsonb_build_object(
    'auto_tags',
    jsonb_build_array(lower(entity_name))
);
END IF;
-- Timestamp sync
IF (to_jsonb(NEW) ? 'updated_at') THEN NEW.updated_at := NOW();
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- 2. ATTACH TRIGGERS
DROP TRIGGER IF EXISTS tr_sessions_auto_tag ON sessions;
CREATE TRIGGER tr_sessions_auto_tag BEFORE
INSERT
    OR
UPDATE ON sessions FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_case_studies_auto_tag ON case_studies;
CREATE TRIGGER tr_case_studies_auto_tag BEFORE
INSERT
    OR
UPDATE ON case_studies FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_protocols_auto_tag ON protocols;
CREATE TRIGGER tr_protocols_auto_tag BEFORE
INSERT
    OR
UPDATE ON protocols FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_capabilities_auto_tag ON capabilities;
CREATE TRIGGER tr_capabilities_auto_tag BEFORE
INSERT
    OR
UPDATE ON capabilities FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_playbooks_auto_tag ON playbooks;
CREATE TRIGGER tr_playbooks_auto_tag BEFORE
INSERT
    OR
UPDATE ON playbooks FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_references_auto_tag ON "references";
CREATE TRIGGER tr_references_auto_tag BEFORE
INSERT
    OR
UPDATE ON "references" FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_frameworks_auto_tag ON frameworks;
CREATE TRIGGER tr_frameworks_auto_tag BEFORE
INSERT
    OR
UPDATE ON frameworks FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_workflows_auto_tag ON workflows;
CREATE TRIGGER tr_workflows_auto_tag BEFORE
INSERT
    OR
UPDATE ON workflows FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_user_profile_auto_tag ON user_profile;
CREATE TRIGGER tr_user_profile_auto_tag BEFORE
INSERT
    OR
UPDATE ON user_profile FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_system_docs_auto_tag ON system_docs;
CREATE TRIGGER tr_system_docs_auto_tag BEFORE
INSERT
    OR
UPDATE ON system_docs FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_entities_auto_tag ON entities;
CREATE TRIGGER tr_entities_auto_tag BEFORE
INSERT
    OR
UPDATE ON entities FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
DROP TRIGGER IF EXISTS tr_insights_auto_tag ON insights;
CREATE TRIGGER tr_insights_auto_tag BEFORE
INSERT
    OR
UPDATE ON insights FOR EACH ROW EXECUTE FUNCTION auto_enrich_metadata();
-- ==============================================================================
-- SCHEMA COMPLETE
-- ==============================================================================