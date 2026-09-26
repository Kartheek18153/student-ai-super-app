# Agent Start Here — First Version Build Order (Specification Only, No Code)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze

Purpose: hand this repo to an AI coding agent so it starts the first version correctly. Scope frozen at v0.20.0 docs plus vision v0.19.0. UI platform intended as Flutter per founder, spec not frozen — agent confirms platform before scaffolding. No code in docs.

## 1. Read Order (Do Not Skip)
1. README.md for index and v0.20.0 state.
2. This file for build order and guardrails.
3. PRD-MVP.md Sec 2-3 plus Sec 5 roles plus Sec 8 open items.
4. ARCHITECTURE-PLAN.md Sec 1-2 modules and roles plus Sec 4 NFRs.
5. DATA-MODEL-SPEC.md entities Sec 1-11 plus Open Decisions.
6. SUPABASE-PLAN.md Sec 3-5 plus Sec 10 locks plus Sec 11 impact.
7. COMPLIANCE-DPDP.md Sec 11 checklist plus Sec 6 breach plus Sec 8-9 rights.
8. AI-FEATURES.md Sec 6-7 rules and cost tiers plus formula rule.
9. SERVICES-INDIA.md Sec 1-2 required services and constraints.
10. ROADMAP.md Phase 0 then Phase 1 exit criteria.
11. FOUNDER-STARTUP-GAPS.md Sec 9-10 pilot plus starters.
12. Vision `student-ai-super-app-complete-feature-list.md` v0.19.0 for full feature context. Do not build beyond PRD Phase 1.

## 2. Frozen Scope for First Version
- Student-only read-only users. Google plus email login only. No phone OTP, no SMS. English only.
- No user uploads of any docs. No ID files. College self-declared text.
- Maintainer seeds all PYQs, materials, notes, test banks, formula packs outside the app. Refresh per semester and on reports. No admin login. No reviewer queue.
- Flashcards removed. Revision via saved notes, incorrect-answer review, retakes, syllabus checklist.
- First-year free enforced: 5 notes, 3 tests, 5 summaries per day, 1 plus 1 doubt cap, shared library plus export cache. Paid deferred to year 2.
- No community UI, career full system, events, projects, placement, GK feed, fitness in v1. Phase 2 and 3 stay deferred.
- DPDP build-now: lawful ground per purpose, processor contracts, accuracy, safeguards, without-delay plus 72-hour breach path, retention erasure, under-18 age gate, access export plus 90-day grievance plus nominee, transfer map, SDF watch.

## 3. Build Order
- Phase 0: Supabase dev, staging, prod projects. Auth Google plus email. Storage buckets per SUPABASE-PLAN.md Sec 4. Backups. Processor contracts. DPDP checklist per COMPLIANCE-DPDP.md Sec 11. Maintainer seed load for pilot scope. Confirm prod region, email and push vendors.
- Phase 1a: Identity and profile with DPDP rights (export, grievance, nominee, withdrawal, age gate).
- Phase 1b: Seeded library reading — PYQ search and filter, viewer with highlight and note anchors, bookmark, saved.
- Phase 1c: Notes plus tests plus doubts with formula rendering, single-definition rules, report-wrong-content with auto-hide and maintainer refresh.
- Phase 1d: Dashboard additions — CGPA, assignments, syllabus checklist. Timetable weekly plus date exceptions plus self-marked attendance with targets and recovery.
- Exit gate: every ROADMAP.md Phase 1 exit bullet passes, including reset and logout-all, holiday rule, grievance trackable, export with sharing list.

## 4. Open Decisions the Agent Must Not Invent
- Pilot college, branch, semester naming. Default Pilot-College-TBD. Ask founder.
- Prod region, email provider, push provider. Ask founder. No defaults.
- Paid tier year 2. Do not design billing in v1.
- Offline depth. Cached timetable plus formula viewing only. Full offline deferred.
- Vector search. Deferred. Use database indexes plus full-text concepts.
- Long-answer evaluation. Manual review only in v1.

## 5. Guardrails for the Build Agent
- Docs-only specs here. Implementation may begin only on founder instruction outside docs mode.
- Keep attendance rule: cancelled and holidays never count. Date exceptions never mutate weekly template.
- Keep student-only: no staff logins, faculty display-only, no ID files.
- Keep AI server-side only with counters. AI disclaimer on notes, tests, doubt screens.
- Keep accessibility: keyboard nav, contrast, scalable text, formula text fallback plus screen-reader labels.
- Stop and ask on any scope beyond PRD Phase 1. Do not pull Phase 2 or 3 forward.

## 6. Change Impact
- New file only. All other docs aligned to v0.20.0 agent-ready freeze.
