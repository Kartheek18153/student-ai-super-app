# Services Needed — India MVP Catalog (Specification Only, No Code)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, read-only maintainer-seeded

Scope: India-only student MVP. Student-only read-only logins, English only, maintainer-seeded content with no user uploads and no reviewer queue. This file lists services only. No code, no keys, no vendor selection beyond open choices.

Related: SUPABASE-PLAN.md for backend mapping, ARCHITECTURE-PLAN.md for modules, COMPLIANCE-DPDP.md for DPDP duties, ROADMAP.md Phase 0 for setup order, FOUNDER-STARTUP-GAPS.md for costs.

## 1. Required Services for MVP

| Service | Planned Use | India Note |
|---------|-------------|------------|
| Supabase Auth | Google sign-in plus email password, email OTP, reset, sessions, logout-all | No phone OTP, no SMS. See SUPABASE-PLAN.md Sec 3 |
| Supabase managed database | All MVP entities per DATA-MODEL-SPEC.md with owner references and auto-approval status | Prod region choice open with India data-residency preference. See Sec 4 |
| Supabase file storage | 4 buckets per SUPABASE-PLAN.md Sec 4: seeded PYQs, seeded materials, exports, gated community media. Private-by-default, maintainer-seeded reads | Shared library sized per pilot scope plus per-student export cache. No personal uploads. Confirm against current pricing |
| Scheduled jobs and server orchestration | Due-cards, reminders, attendance recalc, AI orchestration, calendar export | AI calls server-side only. Usage counters enforce 5 notes, 3 tests, 5 summaries per day |
| AI provider | Seeded summaries, notes, test banks, doubt answers, formula help | Server-side only. First-year free 5 notes, 3 tests, 5 summaries per day. Transfer map required if provider handles data outside India. See COMPLIANCE-DPDP.md Sec 10 |
| Email provider | OTP, reset, notifications, grievance updates | India inbox deliverability required. Vendor choice open |
| Push provider | Test, attendance, deadline, grievance updates | Email plus push only. No SMS |
| Calendar export | Timetable and deadline export via server orchestration | External calendar integration, no staff sync |
| Domain and hosting front | App hosting plus domain, preferably with India-friendly latency | `.in` optional. No prod secrets in client |
| Backups and monitoring | Point-in-time recovery, restore test, auth and storage and job and AI cost monitoring with no student content in logs | Production only. See SUPABASE-PLAN.md Sec 7 |

## 2. India Constraints Applied

- DPDP build-now for 13 May 2027 duties: fiduciary model, lawful ground per purpose, processor contracts, accuracy, safeguards per Rules rule 6, without-delay plus 72-hour Board breach path, retention erasure, under-18 age gate with verifiable parental consent, access plus 90-day grievance plus nominee, transfer map, SDF watch. Full guide in COMPLIANCE-DPDP.md.
- Self-declared college text only. No ID files collected. Masking not needed.
- University and syllabus-version filtering for PYQs and materials. Regulation versions stored per subject, no hard-coded list in this doc.
- English only for MVP. Regional languages deferred to Phase 2 proposal.
- Payments deferred to year 2: no UPI or subscriptions in first-year free MVP. No unlimited-AI promise.

## 3. Explicitly Out for India MVP

- SMS channel and phone OTP. Excluded per v0.4.0 and v0.12.0.
- Vector semantic search. Phase 2 proposal.
- Community realtime. Phase 3 with auto-filters.
- Offline management UI. Deferred, except formula and timetable cached viewing per ARCHITECTURE-PLAN.md.
- Regional language UI. Deferred.

## 4. Open Choices Requiring User Input

1. Supabase prod region with India data-residency preference?
2. Email provider with India deliverability?
3. Push provider?
4. Paid tier limits beyond starter free?
5. Vector search in Phase 2 or later?

## 5. Capacity Tie-In

- 100 pilot, 1,000 Phase 1, 10,000 Phase 2 per SUPABASE-PLAN.md Sec 10. Confirm monthly cost heads — project tier, storage overage, backups, email volume, push volume, domain, AI calls and tokens — against current vendor pricing before launch.

## 6. Change Impact

- New file only. Vision v0.19.0 read-only applies. No scope change beyond v0.19.0.
- README.md index and DOCUMENTATION-GUIDE.md ownership updated.
