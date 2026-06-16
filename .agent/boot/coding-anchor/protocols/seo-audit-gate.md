# SEO Audit Gate

Use this gate before publishing or revising public pages, docs, articles,
landing pages, or search-dependent content.

## Gate

1. Name the target URL, file, or page.
2. Define search intent, audience, page role, and desired action.
3. Check metadata:
   - title
   - meta description
   - canonical URL
   - Open Graph
   - Twitter Card
   - schema need
4. Check structure:
   - one H1
   - ordered H2/H3 hierarchy
   - semantic sections
   - internal links
   - descriptive URL slug
5. Check content:
   - keyword/query appears naturally in title or H1
   - page answers the query directly
   - source-backed claims
   - hidden-gem or proprietary insight
   - next step instead of generic conclusion
6. Check technical basics:
   - mobile readability
   - image alt text
   - lazy/async image handling where relevant
   - link health
   - indexability blockers
7. Identify barnacle SEO opportunities on higher-authority platforms if the
   owned domain is unlikely to rank quickly.
8. Prioritize fixes by impact, confidence, effort, and verification.

## Red Flags

- multiple pages competing for the same query
- title and H1 that do not match the page promise
- missing meta description on public pages
- claims without sources
- thin pages created only to target keywords
- no internal links into or out of the page
- SEO recommendations that ignore the actual distribution channel

## Kira Boundary

Generated SEO audits live under `seo-audits/` and are ignored by Git.
This gate helps prepare and review pages; it does not publish, crawl external
sites, spend money, or change live search settings unless Stephen explicitly
asks for that action.
