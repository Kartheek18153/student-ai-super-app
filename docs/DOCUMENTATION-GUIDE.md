# Documentation Guide — Consistency and Approval Workflow

Version: 0.20.0-approved | Date: 2026-09-21

## 1. Scope
- Create and maintain `.md` files only. No code generation.
- Existing file `student-ai-super-app-complete-feature-list.md` is read-only unless user explicitly approves a change.

## 2. Approval Workflow
1. Present proposed changes with reasons. Reference affected vision sections.
2. Record proposals in `FEATURE-GAPS.md` as Proposals only.
3. Wait for explicit user approval stating what is approved.
4. After approval, update the relevant `.md` files and bump version and date.
5. If proposal is rejected, mark it as Declined with date, do not apply.

## 3. Consistency Rules
- Use vision list section numbers when referencing features (for example, Section 2.4).
- Use term `date-specific exception` for one-day timetable changes, and `weekly template` for recurring timetable.
- Preserve attendance rule: cancelled and holidays never count as absences. Attendance is self-marked only. No faculty verification.
- Student-only rule: no college staff login. Reviewer and admin are internal ops, not college staff. Faculty names are display-only in timetable.
- PRD-MVP, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, ROADMAP, SUPABASE-PLAN must agree on MVP scope. If one changes, update the others in the same approval batch. COMPLIANCE-DPDP.md is authoritative for DPDP duties.
- Each doc header carries Version, Date, Status.

## 4. File Ownership
- `README.md`: index, no feature details.
- `PRD-MVP.md`: what MVP includes and acceptance checks.
- `FEATURE-GAPS.md`: why new items are needed, what would change.
- `ARCHITECTURE-PLAN.md`: module boundaries and non-functional needs.
- `DATA-MODEL-SPEC.md`: entities and integrity rules.
- `ROADMAP.md`: phasing and dependencies, including Phase 0 Supabase setup.
- `SUPABASE-PLAN.md`: backend choice, service mapping, buckets, access principles. Spec only, no code.
- `COMPLIANCE-DPDP.md`: DPDP duties summary. Spec only, not legal advice.
- `FOUNDER-STARTUP-GAPS.md`: startup gaps beyond product. Spec only.
- `SERVICES-INDIA.md`: India services catalog. Spec only, no code.
- `AI-FEATURES.md`: AI features catalog. Spec only, no code.
- `AGENT-START-HERE.md`: agent build order and guardrails. Spec only, no code.

## 5. Change Log Format
When a change is approved, append here:
- Date | Approved by | Change summary | Files updated

| Date | Approved by | Change summary | Files updated |
|------|-------------|----------------|---------------|
| 2026-09-21 | User | Initial 7-file doc set created, vision list untouched | All listed in README |
| 2026-09-21 | User (okey do it) | P0 approved: auth recovery, CGPA, assignments, syllabus checklist, annotation, OCR and lecture-link, moderation prereq, contributor roles. Vision list untouched | FEATURE-GAPS, PRD-MVP, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, ROADMAP, README |
| 2026-09-21 | User (use supabase) | Supabase approved as backend. New SUPABASE-PLAN.md. Phase 0 added. Vision list untouched | SUPABASE-PLAN, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, ROADMAP, README |
| 2026-09-21 | User (google + email only) | Auth locked to Google login and email login only. Phone OTP and SMS excluded. Vision list untouched | SUPABASE-PLAN, PRD-MVP, ARCHITECTURE-PLAN, ROADMAP, README |
| 2026-09-21 | User (DPDP compulsory) | DPDP build-now documented. New COMPLIANCE-DPDP.md. Phase 0 checklist added. Vision list untouched | COMPLIANCE-DPDP, SUPABASE-PLAN, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, PRD-MVP, ROADMAP, README |
| 2026-09-21 | User (okey polish) | DPDP polish: 13 May 2027 date in Roadmap Phase 0, Phase 1 exit adds grievance plus export check. Vision list untouched | ROADMAP, README |
| 2026-09-21 | User (startup missing) | Founder gaps documented. New FOUNDER-STARTUP-GAPS.md. Vision list untouched | FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (okey do it starters) | Starters locked: pilot TBD with 100 waitlist, free 5 notes 3 tests 5 summaries per day, 100MB. Vision list untouched | FOUNDER-STARTUP-GAPS, SUPABASE-PLAN, ROADMAP, README |
| 2026-09-21 | User (student-only) | Student-only: no college staff login, self-marked attendance, internal reviewers. Faculty display-only. Vision list untouched | PRD-MVP, ARCHITECTURE-PLAN, SUPABASE-PLAN, ROADMAP, DATA-MODEL-SPEC, README |
| 2026-09-21 | User (read all check) | Consistency fix v0.8.1: FEATURE auth+roles, COMPLIANCE version, FOUNDER money, PRD dedupe, SUPABASE limits+roles, DATA faculty display-only, ROADMAP qualifier. Vision list untouched | All docs |
| 2026-09-21 | User (improve vision) | Vision list improved with approval: student-only header, P0 auth/academic/DPDP rights, annotation/OCR/lecture-link/contributor, AI single-refs, attendance/moderation/diet/privacy clarified | student-ai-super-app-complete-feature-list.md, README |
| 2026-09-21 | User (english only) | English-only MVP locked, regional deferred to Phase 2. Vision v0.9.0 applies | PRD-MVP, ARCHITECTURE-PLAN, README |
| 2026-09-21 | User (okey review fix) | Stale-ref cleanup to v0.9.1: vision v0.9.0 applied refs, PRD login wording, README source note. All aligned | FEATURE-GAPS, SUPABASE-PLAN, COMPLIANCE-DPDP, PRD-MVP, DATA-MODEL-SPEC, ROADMAP, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (formula rendering) | Formula rendering specced: LaTeX entry, crisp display, fallback, error preview in notes/tests/flashcards/materials/doubts | PRD-MVP, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, ROADMAP, student-ai-super-app-complete-feature-list.md, README |
| 2026-09-21 | User (okey alignment) | Align all to v0.10.0, vision footer v0.10.0, report-wrong-question in Phase 1 exit | FEATURE-GAPS, COMPLIANCE-DPDP, FOUNDER-STARTUP-GAPS, SUPABASE-PLAN, PRD-MVP, ROADMAP |
| 2026-09-21 | User (how many users) | Capacity targets 100 pilot / 1k Phase 1 / 10k Phase 2 plus monthly cost heads, plan-dependent | SUPABASE-PLAN, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (full auto no human) | Full-auto pipeline: auto-approve uploads, auto-hide reports, no reviewer queue. DPDP legal contacts remain humans as required | PRD-MVP, ARCHITECTURE-PLAN, SUPABASE-PLAN, DATA-MODEL-SPEC, ROADMAP, FOUNDER-STARTUP-GAPS, student-ai-super-app-complete-feature-list.md, README |
| 2026-09-21 | User (services india + md) | India services catalog created. New SERVICES-INDIA.md. No code | SERVICES-INDIA, README |
| 2026-09-21 | User (all ai features md) | AI features catalog created. New AI-FEATURES.md with cost tiers. No code | AI-FEATURES, README |
| 2026-09-21 | User (remove flashcards) | Flashcards removed v0.15.0 for AI and storage cost, revision via notes plus tests | student-ai-super-app-complete-feature-list.md, PRD-MVP, ARCHITECTURE-PLAN, DATA-MODEL-SPEC, ROADMAP, AI-FEATURES, README |
| 2026-09-21 | User (admin seed-once) | Seed-once shared library: ops seeds PYQs/materials/notes/tests/formulas once, refresh per semester, no admin login | PRD-MVP, SUPABASE-PLAN, ROADMAP, README |
| 2026-09-21 | User (okey stale fix) | Stale refs fixed to v0.16.1: flashcards fully out, vision v0.15.0 refs, auto-check wording | PRD-MVP, ROADMAP, README, SUPABASE-PLAN |
| 2026-09-21 | User (initial free) | Initial free-only enforced, paid deferred to Phase 2, AI cuts active, 1 paid prod max | PRD-MVP, SUPABASE-PLAN, ROADMAP, AI-FEATURES, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (first year free) | First year full free access for 12 months, paid deferred to year 2 | PRD-MVP, SUPABASE-PLAN, ROADMAP, AI-FEATURES, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (read-only users) | Read-only users, maintainer seeds all content, no uploads including ID files | student-ai-super-app-complete-feature-list.md, PRD-MVP, SUPABASE-PLAN, DATA-MODEL-SPEC, ROADMAP, AI-FEATURES, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (okey fix it) | Stale refs fixed to v0.19.1: uploads/ID/flashcards wording, vision v0.19.0 refs | ROADMAP, ARCHITECTURE-PLAN, SUPABASE-PLAN, PRD-MVP, README, FOUNDER-STARTUP-GAPS |
| 2026-09-21 | User (okey storage fix) | Storage wording fixed to v0.19.2: shared library plus export cache, no personal 100MB, no ID masking | ROADMAP, FOUNDER-STARTUP-GAPS, README |
| 2026-09-21 | User (agent-ready update) | Agent-ready freeze v0.20.0: stales fixed across ARCH/SUPABASE/SERVICES/COMPLIANCE/AI/DATA/FEATURE/FOUNDER/PRD/ROADMAP, new AGENT-START-HERE.md build order | All docs plus AGENT-START-HERE |
