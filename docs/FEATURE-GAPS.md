Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, vision v0.19.0 applies, P1/P2 still proposals.

> Rule: Nothing here modifies `student-ai-super-app-complete-feature-list.md`. Original vision file remains read-only. Approvals below apply to new docs only.

## P0 — Must-Have Missing (APPROVED 2026-09-21)

### 1. Authentication and Account Recovery — APPROVED student-only
Why: Vision lists Registration and Login but no reset, session, or verification flow. Unbuildable without it.
Approved scope: Google login and email login only (Google sign-in, email and password, email OTP), password reset via email, logout all devices, college ID verification by internal reviewer. No phone OTP. No college staff login.
Applied to: PRD-MVP 3.1, ARCHITECTURE-PLAN Identity, DATA-MODEL-SPEC Student Profile.
Affects vision: Section 1 and Section 14 if vision v0.9.0 is updated (applied now).

### 2. CGPA and Marks Tracker — APPROVED
Why: Core student need, completely absent. Drives retention.
Approved scope: new sub-module under Dashboard: semester marks entry, SGPA and CGPA calculation, goal tracking.
Applied to: PRD-MVP 3.1, DATA-MODEL-SPEC Academic Record.
Affects vision: Section 1 if vision v0.9.0 is updated (applied now).

### 3. Assignments Tracker — APPROVED
Why: Deadlines are a daily pain; Tasks and Reminders alone are too generic.
Approved scope: assignment list with due date, subject link, status, reminder linkage.
Applied to: PRD-MVP 3.1, DATA-MODEL-SPEC Assignment.
Affects vision: Section 1 and Section 12 if vision v0.9.0 is updated (applied now).

### 4. Syllabus Completion Tracker — APPROVED
Why: Materials exist but no percent-complete per unit.
Approved scope: unit-wise checklist per subject linked to materials and notes.
Applied to: PRD-MVP 3.3, DATA-MODEL-SPEC Syllabus Checklist.
Affects vision: Section 2.2 if vision v0.9.0 is updated (applied now).

### 5. PDF Annotation — APPROVED
Why: Viewer without highlight and comments limits study value.
Approved scope: highlight, note, and bookmark anchors inside viewer.
Applied to: PRD-MVP 3.2, 3.3, DATA-MODEL-SPEC Annotation.
Affects vision: Section 2.1 and 2.2 if vision v0.9.0 is updated (applied now).

### 6. OCR and Lecture-Link Notes — APPROVED
Why: Students study from photos and videos, not just PDFs.
Approved scope: photo-to-text import, video lecture link to summary (with source attribution).
Applied to: PRD-MVP 3.3, 3.4.
Affects vision: Section 2.2 and 2.3 if vision v0.9.0 is updated (applied now).

### 7. Content Moderation and Safety — APPROVED as Phase 3 prerequisite
Why: Required before Community and Team-Up can launch.
Approved scope: report post and user, block, spam filter, removal audit trail.
Applied to: ARCHITECTURE-PLAN Engagement, ROADMAP Phase 3 dependency.
Affects vision: Section 8 if vision v0.9.0 is updated (applied now).

### 8. Contributor and Approval Role — APPROVED student-only
Why: Vision assumes a PYQ and material library but no uploader or reviewer.
Approved scope: student contributor submit flow plus internal reviewer (internal ops, not college staff) approve and reject with reason. No college staff accounts.
Applied to: PRD-MVP User Roles, ARCHITECTURE-PLAN Roles, DATA-MODEL-SPEC approval status.
Affects vision: Section 2.1, 2.2, and Section 14 if vision v0.9.0 is updated (applied now).

## P1 — Should-Have (proposed)

- Calendar sync: export timetable and exam countdowns to external calendars.
- Resume builder with templates and export, not only guidance.
- Coding practice tracker and contest reminders.
- Gamification: streaks, XP, leaderboards. Current Achievements entry is underspecified.
- Multi-language support and accessibility: regional languages, text-to-speech, font scaling, dark mode.
- Focus tools: Pomodoro timer, exam countdown, stress resources.
- Mentorship and alumni linkage for Career module.
- Fees and scholarship application status tracking.

## P2 — Nice-to-Have (proposed)

- Campus life: mess menu, bus routes, library availability.
- Portfolio hosting and project showcase embeds.
- Study-group voice and video session scheduling.

## Duplicates and Clarifications — APPROVED and applied to vision v0.9.0

1. AI Test Generator appears in Sections 2.4, 3, and elsewhere. Approved rule: define once in PRD-MVP 3.5, reference elsewhere.
2. AI Notes Generation appears in 2.3 and 3. Approved rule: define once in PRD-MVP 3.4, reference elsewhere.
3. Section 11 states diet planner is excluded but retains adjacent fitness tracking. Approved clarification: diet planning stays excluded; general wellness reminders stay in scope for Phase 3.
4. Attendance rule (cancelled and holidays not counted) is correct. Approved rule: date-specific changes never mutate weekly template unless user selects Update Regular Timetable. Applied to PRD-MVP 3.8 and ARCHITECTURE-PLAN.

## What Was Changed in v0.9.0
- `student-ai-super-app-complete-feature-list.md` improved with approval, see guide changelog.
- No deletions from vision scope, generics made specific plus 1 duplicate consolidated.
- P1 and P2 remain proposals, not approved.
