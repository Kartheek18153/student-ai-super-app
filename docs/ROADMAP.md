# Roadmap — Phased Delivery Plan

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, build order in AGENT-START-HERE.md

## Phase 0 — Supabase Setup plus DPDP Readiness (prerequisite) — APPROVED
- Provision development, staging, production projects.
- Configure Auth methods: Google sign-in plus email only (password, email OTP, reset). No phone OTP.
- Configure storage buckets per SUPABASE-PLAN.md Section 4, access principles per Section 5.
- Enable backups for production. Apply starter locks: shared seeded library sized per pilot scope plus per-student annotation and export cache, 5 notes, 3 tests, 5 summaries per day. No personal-upload storage. See FOUNDER-STARTUP-GAPS.md Section 10.
- Seed-once by maintainer: loads PYQs, materials, notes, test banks, formula packs once per pilot scope outside the app, refreshes per semester and on report thresholds. No admin login. No user uploads.
- Pilot scope: 1 college, 1 branch, 1 semester (Pilot-College-TBD until named). Goal 100 waitlist.
- DPDP build-now checklist per COMPLIANCE-DPDP.md Section 11: purposes recorded, processor contracts reviewed, access owners named with no ID files collected, breach playbook with without-delay user notice and 72-hour Board path, retention categories, age gate with parental consent, access export plus 90-day grievance plus nominee, transfer map, SDF watch. Build now for duties scheduled 13 May 2027.

## Phase 1 — MVP First-Year Free (Learn, Practice, Test, Attend) — APPROVED
Objective: usable daily study loop with 12 months full free access from launch. Paid tier deferred to year 2.

Includes:
- Dashboard and profile plus approved additions: auth recovery and verification, CGPA tracker, assignments tracker.
- PYQ library, materials, notes generation from maintainer-seeded library: annotation, syllabus checklist, lecture-link notes, formula rendering with fallback. Students read seeded packs. No uploads, no OCR imports.
- AI doubt assistance, test and mock system subset (single-definition rule) with formula rendering.
- Revision without flashcards: saved notes, incorrect-answer review, retakes, syllabus checklist. No spaced-repetition scheduling.
- Weekly timetable, date exceptions, attendance with targets, self-marked only.
- Maintainer-seeded library only. Reports resolve via auto-hide and maintainer refresh. No user uploads. No college staff accounts. No reviewer queue.

Exit criteria:
- Onboarding to dashboard works, including reset and logout-all.
- Seeded PYQ search, view, annotate, bookmark works. No upload flow.
- Seeded material opens with summary plus key points and can be bookmarked. Syllabus checklist percent-complete works.
- Timed MCQ test with history works, including formula questions. Report-wrong-question auto-creates triage item with auto-hide rules.
- Revision via notes, incorrect review, retakes works. No flashcard scheduling.
- Holiday and cancelled classes do not lower attendance.
- Maintainer seeding verified. Report-wrong-content triggers maintainer refresh with auto-hide rules.
- Privacy request creates trackable grievance with 90-day response cap. Access export includes sharing list.

## Phase 2 — Progress and Opportunities
Objective: connect study to outcomes.

Includes (from vision list, pending detailed PRD):
- Calendar sync, offline management.
- Career roadmap subset, events and opportunities discovery.
- Search and analytics subset, notifications subset.
- P1 proposals remain unapproved: resume builder, coding tracker, gamification XP, multi-language, focus tools, mentorship, fees tracking.

## Phase 3 — Community and Portfolio
Objective: collaboration and career launch.

Includes:
- Team-up, team management, communities with auto-filters plus auto-hide on reports, UI in Phase 3. No human moderation queue.
- Project workspace, showcase, portfolio entries.
- Placement prep, mock interviews, resume builder (still proposal, not approved).
- GK feed, wellness reminders, full analytics.

## Explicitly Deferred
- Diet planner remains excluded per vision Section 11. Wellness reminders stay in scope for Phase 3.
- SMS notifications deferred. Phone OTP excluded per v0.4.0 auth decision.
- Long-answer auto-evaluation deferred to manual review in Phase 1.

## Dependency Notes — UPDATED read-only maintainer-seeded
- Community launch uses auto-filters plus auto-hide on reports. No human moderation queue.
- Content library is maintainer-seeded only. No user uploads. No reviewer accounts. No college staff accounts.
- Attendance: self-marked only. No faculty verification.
