# Supabase Backend Plan (Specification Only, No Code)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, read-only maintainer-seeded

This document records Supabase as the approved backend platform for the Student AI Super-App MVP. It contains planning descriptions only. No SQL, no policy code, no API code, no keys.

Related docs: ARCHITECTURE-PLAN.md for module boundaries, DATA-MODEL-SPEC.md for entities, ROADMAP.md for phasing, PRD-MVP.md for scope.

## 1. Why Supabase for This App

- Auth covers approved needs with Google login and email login only: Google sign-in, email and password login, email OTP option, password reset via email, session list, logout-all via session revocation, college verification status stored as profile fields. No phone OTP. No SMS.
- Managed relational storage fits academic records: students, subjects with syllabus version, marks, assignments, syllabus checklists, question papers, materials, notes, tests, attempts, decks, cards, review states, timetable templates, date exceptions, attendance records.
- File storage fits PYQs, materials, personal uploads, profile college ID, note exports, with private-by-default and approval-gated public reads.
- Row-level access concepts fit student-owned data plus reviewer-approved shared library plus Phase 3 community moderation prep.
- Scheduled jobs and server-side orchestration fit due-card calculation, low-attendance checks, deadline reminders, and AI orchestration without exposing secrets to clients.
- Realtime concepts fit Phase 2 and 3 needs: notification feed, team activity updates, community posts — deferred for MVP except attendance dashboard refresh.

## 2. Service Mapping

| App Need | Supabase Service (planned use) | Notes |
|----------|--------------------------------|-------|
| Registration, login, OTP, reset, sessions, logout-all | Auth | Google sign-in plus email methods only. Email OTP only. No phone OTP. See Section 3 |
| All MVP entities in DATA-MODEL-SPEC.md | Managed relational database | One logical project with separate development, staging, production projects |
| PYQs, materials, seeded notes, exports | File storage | Bucket plan in Section 4. No user uploads. Shared reads require seeded-approved status |
| Owner-only dashboard plus seeded shared reads | Row-level access rules described in words | Students see own dashboard data plus maintainer-seeded shared library. Maintainer seeds outside the app with no login. Reports trigger maintainer refresh. No contributor, reviewer, or admin logins |
| Due reminders, recovery estimates, digest notifications | Scheduled jobs and server orchestration | Attendance recalculation stays traceable to timetable changes |
| AI summaries, notes, test generation, doubt answers | Server-side AI orchestration | AI provider calls happen server-side only. Usage counters enforce first-year free limits: 5 notes, 3 tests, 5 summaries per day. See Section 10 |
| Search by college, university, regulation, subject, year | Database indexes and full-text concepts, vector search optional | Vector search for semantic PYQ and notes search is P1 proposal, not approved for MVP |
| Calendar export, push and email | External integrations via server orchestration | SMS deferred per ROADMAP.md |

## 3. Authentication Plan — APPROVED: Google + email only

- Methods in MVP: Google sign-in, email and password, email OTP, password reset via email link.
- Explicitly excluded: phone OTP, SMS login, SMS reset.
- Why: avoids SMS provider cost and extra PII, covers students with Google or any email inbox, keeps Phase 0 setup to two providers.
- Session handling: list active sessions in profile, revoke single session, revoke all on logout-all and password change.
- Verification: self-declared college name and branch text only. No ID files collected. No verification queue.
- Account deletion: request flow deletes or anonymizes student-owned rows and private files, retains anonymized audit entries for safety reports. Export-before-delete offered.

## 4. Storage Bucket Plan (Names Are Labels, Not Code)

- question-papers-approved: read by all authenticated students, write by maintainer seeding outside the app only. No user uploads. No reviewer queue.
- study-materials-approved: same as above, plus maintainer-seeded standard notes, test banks, formula packs refreshed per semester and on report thresholds.
- personal-uploads-private: removed in read-only model. No personal PDFs, photos, or drafts stored.
- college-id-private: removed. College is self-declared text with no ID file. Never collect ID files.
- note-exports-private: owner-only generated exports of seeded content for offline reading.
- community-media-gated: reserved for Phase 3. Auto-filtered, auto-hidden on report thresholds.

Rules: private-by-default. Maintainer-seeded status gates shared reads. Reports trigger maintainer refresh with audit log. Download allowed subject to rights. Retention periods per DATA-MODEL-SPEC.md Open Decisions, erasure at purpose end.

## 5. Access Control Principles (Described, Not Coded) — read-only student-only

- Student: only login type, read-only consumer of seeded library plus own dashboard, CGPA, assignments, timetable, attendance, attempts, annotations, exports. No uploads. No reviewer or admin logins.
- Maintainer seeding outside the app with no login: loads PYQs, materials, notes, test banks, formula packs once per scope, refreshes per semester and on report thresholds.
- Reports: report counts trigger auto-hide and maintainer refresh with audit log. No user triage queue.
- Shared library reads require seeded-approved status. Personal dashboard reads require ownership. No ID files collected.
- All seeding and report actions record source, reason code, and timestamp for auditability.
- DPDP grievance and breach contacts are legal owners, not logins, with no content powers.

## 6. Data Organization Notes

- Every student-owned record carries an owner reference to the authenticated user.
- Shared library records carry uploader reference plus approval status plus syllabus version for regulation filtering.
- Timetable weekly template and date exceptions stay separate. Attendance records link to resolved class instances, not directly to template rows, so recalculation stays traceable.
- AI artifacts link to source references: note links to material or upload, test links to scope, doubt message links to material, summary links to file.
- Counters for AI usage per student per day stored for quota enforcement once limits are decided.

## 7. Environments and Operations (Planned)

- Three projects: development, staging, production. No production secrets in client apps.
- Backups and point-in-time recovery enabled for production. Restore tested before Phase 1 launch.
- Staging mirrors approval workflow for contributor and reviewer testing.
- Observability: auth failures, storage errors, scheduled job runs, AI orchestration latency and cost. No student content in logs.

## 8. Privacy and Compliance Notes — see COMPLIANCE-DPDP.md for full guide

- Fiduciary model: app as Data Fiduciary, student as Data Principal, Supabase plus AI plus email plus push vendors as Data Processors under contract. App remains responsible. See COMPLIANCE-DPDP.md Sections 1 to 3.
- Lawful ground recorded per purpose: consent or section 7 use. No open-ended reuse.
- Self-declared college text only. No ID files collected, no masking needed, deletion on account delete covers dashboard data.
- Data export: student can request export of profile, notes, decks, attempts, attendance history plus sharing list (right to access).
- Grievance contact in app with published response period capped at 90 days. Nominee field in account settings.
- Age gate for under-18 with verifiable parental consent flow. No tracking or targeted ads to children.
- Breach readiness: without-delay user notice plus Board notification with detailed update within 72 hours unless extended. Keep facts and decisions documented.
- Retention by purpose with erasure at purpose end, subject to legal duties. Backups age out on rotation.
- Cross-border map for any foreign provider region. SDF watch log. Penalty risk note: up to Rs 250 crore for failure of reasonable safeguards, not automatic.
- AI training opt-out to be decided and documented before AI orchestration goes live.
- Notification preferences respected before any push or email. Quiet hours to be decided in Phase 2.

## 9. What Is Explicitly Out of This Plan

- No schema code, no policy code, no function code, no client integration code.
- No AI prompts, no model selection.
- No vector embeddings in MVP. Semantic search is Phase 2 proposal.
- No community realtime in MVP. Included as Phase 3 dependency.
- No technology beyond Supabase plus external calendar, push, email, and server-side AI provider.
- No phone auth. No SMS channel.

## 10. Open Decisions, Starter Locks, and Capacity Targets

Starter locks APPROVED 2026-09-21, enforced for first-year free access:
- AI free: 5 notes, 3 tests, 5 summaries per student per day for 12 months from launch. Paid tier deferred to year 2.
- Storage: shared seeded library plus per-student annotations and exports only. No personal uploads. Size shared library separately from per-student export cache.
- Channels: email plus push only.
- Projects: 1 paid prod max plus free dev and staging. No 3-paid setup in initial version.

Capacity targets APPROVED 2026-09-21 (plan-dependent, load-test before launch):
- Phase 1 target: 1,000 registered read-only students on paid Supabase project. Planning max: shared seeded library plus per-student annotation and export cache, ~13,000 AI calls per day at full free-limit use.
- Phase 2 target: 10,000 registered students. Requires prod region choice, read scaling, storage lifecycle, auto-check throughput, grievance staffing for 90-day cap, SDF watch.
- Pilot: 100 waitlist read-only users on seeded library plus ~1,300 AI calls per day max.
- Cost heads to track monthly: Supabase project tier, file storage overage, database backups, email provider volume, push provider volume, domain, AI provider calls and tokens. No limits quoted here because vendor pricing changes — confirm against current pricing before launch.

Still open requiring input:
1. Production region for data residency?
2. Vector search in Phase 2 or later?
3. Push provider and email provider choices?

Resolved in v0.4.0: Google sign-in included. Email OTP sufficient. Phone OTP excluded.

## 11. Change Impact

- ARCHITECTURE-PLAN.md Section 3 and 5 updated to reference this plan.
- DATA-MODEL-SPEC.md gains Supabase mapping note, no entity changes.
- ROADMAP.md gains Phase 0 Supabase setup prerequisite plus DPDP checklist.
- COMPLIANCE-DPDP.md is the authoritative DPDP summary. This section defers to it.
- Vision `student-ai-super-app-complete-feature-list.md` v0.15.0 applies.
