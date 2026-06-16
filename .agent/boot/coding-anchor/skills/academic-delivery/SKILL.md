---
name: academic-delivery
description: Kira-local formal deliverable pipeline for reports, essays, briefs, decks, and knowledge work.
context_trigger: "deliverable, report, essay, brief, assignment, capstone, submission, docx, pdf, deck, rubric, APA, MLA, Harvard, formal report"
source: "Adapted from examples/skills/workflow/academic-delivery/SKILL.md."
---

# Academic Delivery

Use this skill when Kira needs to produce or review a formal knowledge
deliverable with a brief, audience, rubric, format, deadline, citation standard,
or submission gate.

## Contract

- Parse the brief before drafting.
- Treat V1 as a working draft, not a deliverable.
- Red-team the draft before delivery.
- Revise against accepted criticisms.
- Compile to the required format.
- Verify rubric, structure, citations, word count, and final file/export
  requirements before calling it done.
- If the work is commercial, pair this with `client-pricing` before accepting
  scope or price.

## Default Flow

1. Intake: extract audience, deadline, deliverable type, word/page count,
   format, rubric, required sources, and submission requirements.
2. Scope: classify the deliverable as essay, report, problem set, deck,
   proposal, technical brief, research paper, or client work.
3. Research: load local context first, then use `deep-research-loop` when
   external or current sources are required.
4. Draft: produce V1 to spec, with citations or evidence markers where needed.
5. Red-team: run `red-team-review` against the brief, rubric, evidence,
   counterarguments, format, and audience fit.
6. Revise: accept valid criticisms, reject category errors, and produce V2.
7. Compile: format headings, references, appendices, tables, exports, and file
   naming to the requested standard.
8. Deliver: proofread and verify the exit gate before sending, submitting, or
   declaring complete.

## Exit Gate

- Brief and rubric requirements addressed.
- Required format satisfied.
- Word/page count inside the requested tolerance.
- Claims have evidence or citations.
- Counterargument or alternative interpretation included when argumentative.
- Tables, figures, appendices, and references are present when required.
- Final file/export path is known and verified.
- Red-team review completed and accepted fixes applied.

## Helper

Use `bin/athena-coding-anchor-deliverable "<deliverable>"` to create a local
delivery plan. Generated delivery plans live under `formal-deliverables/` and
are ignored by Git unless Stephen deliberately promotes one.

