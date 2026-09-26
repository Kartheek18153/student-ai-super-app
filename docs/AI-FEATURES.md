# AI Features Catalog (Specification Only, No Code)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, read-only maintainer-seeded

Scope: every AI-powered feature in vision v0.19.0 plus MVP subset. Student-only read-only users, English only, maintainer-seeded outputs with no user uploads. Server-side AI orchestration only with first-year free counters. No prompts, no model selection, no code.

Related: PRD-MVP.md Sec 3.3-3.7, vision Sec 2.2-2.4 plus Sec 3 plus Sec 4, ARCHITECTURE-PLAN.md rendering rule, DATA-MODEL-SPEC.md formula blocks, ROADMAP.md phasing, SUPABASE-PLAN.md Sec 10 limits, SERVICES-INDIA.md.

## 1. Study Material Intelligence (vision Sec 2.2, PRD Sec 3.3)

- PDF content summarization.
- Important topics extraction.
- Key points and definitions extraction.
- Formula extraction with formula rendering (live preview, crisp display, text fallback, error preview).
- Important questions extraction.
- PDF content understanding and PDF question answering.
- AI study-material generation.
- MVP: summaries, key points, definitions, formulas, important questions, PDF Q&A on maintainer-seeded PDFs within free limits.
- Cost control: whole-PDF conversion is the most expensive. Prefer topic and chapter scope. Starter: 5 summaries per student per day.

## 2. Notes Intelligence (vision Sec 2.3 single definition, PRD Sec 3.4)

- AI-generated notes, single definition referenced from Sec 3.
- Notes for topics, chapters, maintainer-seeded library, lecture links with source attribution. No upload-based or photo-import notes.
- Short revision notes, detailed study notes, exam-oriented notes, concept-wise notes.
- Important definitions and formula-based notes with rendering rule.
- Organize by subject and chapter, edit, save, export, search saved notes.
- MVP: all above within free limits. Starter: 5 notes per student per day.
- Cost control: lecture-link notes deferred first if AI spend spikes. Photo-import notes capped with uploads quota.

## 3. Test Intelligence (vision Sec 2.4 single definition, PRD Sec 3.5)

- AI test generator and AI mock-test generator, single definitions referenced from Sec 3.
- Practice, subject, topic, chapter, syllabus, PYQ-based, PDF-to-question and PDF-to-test generation.
- MCQ, True/False, short answer with auto-evaluation. Long answer deferred to manual review.
- Difficulty selection, custom creation, timed mode, exam simulation.
- Explanations, incorrect-answer review, history, retake, performance analysis.
- Report-wrong-question with auto-triage. See ROADMAP.md Phase 1 exit.
- MVP: all above within free limits. Starter: 3 tests per student per day.
- Cost control: PDF-to-full-test deferred first. Prefer topic and chapter tests.

## 4. Doubt and Tutor Intelligence (vision Sec 3, PRD Sec 3.6)

- AI study assistant and AI doubt-clearing assistant.
- Topic and chapter explanation, step-by-step concepts, simplified difficult topics, examples-based learning.
- Follow-up questions with session context. Cap: 1 answer plus 1 follow-up per doubt in free tier to bound loops.
- Personalized learning recommendations.
- Important topic identification, weak-topic identification, revision recommendations, study progress analysis.
- MVP: all above within free limits. Weak-topic and revision batching weekly if spend spikes.
- Trust rule: AI may be wrong, verify with syllabus. Source links where available.

## 5. Flashcard Intelligence — REMOVED v0.15.0
- Removed to control AI and storage cost. No AI deck generation, no scheduling, no due notifications. Revision via Sec 2 notes, Sec 3 incorrect-answer review and retakes.

## 6. Cross-Cutting AI Rules (All Features)

- Server-side calls only. No secrets in client. Usage counters enforce starter locks. See SUPABASE-PLAN.md Sec 10.
- English only for MVP. Regional deferred to Phase 2 proposal.
- Formula rule everywhere: LaTeX-style input, live preview, crisp display, cached offline viewing, text fallback plus screen-reader labels, error preview. See ARCHITECTURE-PLAN.md Sec 4.
- Full-auto: uploads publish via automated checks, reports auto-hide with audit log, no human queue. DPDP grievance and breach contacts remain named humans as required by law.
- DPDP: lawful ground per purpose, accuracy for decisions, export with sharing list, 90-day grievance, nominee, age gate with parental consent. See COMPLIANCE-DPDP.md.
- AI disclaimer required on notes, tests, doubt screens: AI may be wrong, verify with syllabus and faculty display info.

## 7. Cost Tiers — First-Year Free Enforced

- Free enforced for 12 months from launch: 5 notes, 3 tests, 5 summaries per student per day. Doubt follow-ups capped at 1 plus 1. Paid tier deferred to year 2.
- Active cuts for cost: no lecture-link notes, no PDF-to-full-test, no repeated re-explains, no daily weak-topic pushes in free initial. Flashcards already removed v0.15.0.
- 10k lowest-cost variant stays optional: 5 notes plus 2 tests per week, summaries shared-library only. To be locked separately if approved.

## 8. Change Impact

- Catalog only. No scope change. MVP subset refs PRD-MVP.md Sec 3.3-3.6 plus 3.8. Vision refs Sec 2.2-2.4 plus Sec 3. Sec 4 flashcards removed.
- README.md index and DOCUMENTATION-GUIDE.md ownership updated.
