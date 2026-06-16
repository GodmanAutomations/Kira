---
name: seo-auditor
description: Kira-local technical SEO, content structure, and search visibility triage skill.
context_trigger: "SEO, audit website, rank, ranking, lighthouse, technical SEO, site audit, search performance, metadata, organic search"
source: "Adapted from examples/skills/business/seo-auditor/SKILL.md plus current Kira content and UX protocols."
---

# SEO Auditor

Use this skill when a public page, article, docs surface, or landing page needs
search visibility and technical quality checks before publishing or revising.

## Contract

- Do not treat SEO as keyword stuffing.
- Start with the search intent, page role, and distribution channel.
- Check technical basics before content strategy.
- Prefer one authoritative page with clear internal links over many thin pages.
- Identify barnacle opportunities when the owned site is unlikely to rank soon.
- Separate confirmed page facts from recommended changes.

## Default Flow

1. Name the target URL, file, or page.
2. Define query intent, audience, page role, and desired action.
3. Check metadata: title, meta description, canonical, Open Graph, Twitter Card,
   and schema need.
4. Check structure: one H1, ordered headings, semantic sections, tables, lists,
   and internal links.
5. Check content: hidden-gem insight, source quality, claim support, freshness,
   next step, and content gaps.
6. Check technical basics: mobile, performance, image alt text, lazy loading,
   link health, indexability, and URL slug.
7. Prioritize fixes by impact, confidence, effort, and verification.

## Output Shape

Create a compact `seo_triage_plan.md` style report with:

- target
- search intent
- technical checks
- content checks
- structure checks
- barnacle SEO opportunities
- prioritized fixes
- verification
- open questions
- next slice

## Helper

Use `bin/athena-coding-anchor-seo-audit "<target>"` to create a local SEO
triage template. Generated SEO audits live under `seo-audits/` and are ignored
by Git unless Stephen deliberately promotes one.
