# Data Model Spec (Specification Only)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, read-only, no implementation

Conventions: each entity lists key attributes in plain language. No SQL, no code. Supabase mapping: each entity corresponds to managed database tables with owner references and approval status fields, files live in storage buckets per SUPABASE-PLAN.md Section 4.

## 1. Student Profile
- Identifier, name, contact, college name and branch self-declared text, no ID file collected (approved read-only).
- Department and branch, academic year, semester.
- Enrolled subjects with syllabus version.
- Skills, interests, academic goals, career goals.
- Auth: password reset token status, session list, logout-all flag (approved, descriptive only).
- DPDP descriptive fields: lawful ground and purpose per record, age-verification status and parental consent reference for under-18, nominee reference, grievance request linkage, retention category, sharing log reference. See COMPLIANCE-DPDP.md Sections 2, 8, 9.

## 1A. Academic Record (approved)
- Semester marks entry, subject grade, credits, SGPA, CGPA, goal CGPA.

## 1B. Assignment (approved)
- Owner, subject, title, due date, status (pending, submitted, overdue), reminder link.

## 1C. Syllabus Checklist (approved)
- Subject, unit, topic, completion flag, linked material and note references, percent-complete derived per subject.

## 2. Question Paper
- Subject, university, branch, semester, year, topic and chapter tags.
- File reference seeded by maintainer, seeded-approved status, bookmark links.
- Annotation links (highlight, note anchors).
- View history per student.

## 3. Study Material
- Subject, topic, chapter, syllabus linkage.
- Maintainer-seeded file reference, summary, key points, definitions, formulas, important questions.
- Uploader, approval status by automated checks, bookmarks, annotations.

## 4. Note
- Maintainer-seeded source reference, no personal uploads.
- Content revisions, note type (short, detailed, exam-oriented).
- Formula blocks with source text, rendered output reference, validity flag, text fallback. See ARCHITECTURE-PLAN.md rendering rule.
- Saved, exported, and search indexing flags.

## 5. Test and Attempt
- Test: owner, scope (subject, topic, chapter, syllabus), question list, difficulty, time limit, mode.
- Question: type (MCQ, True/False, short, long), prompt, options, correct answer reference, explanation. Formula blocks as in Note entity, with validity flag and fallback.
- Attempt: student, test, answers, score, per-question correctness, timestamps, retake linkage.

## 6. Doubt Session
- Student, topic context, message sequence, linked material references, follow-up linkage.

## 7. Flashcard System — REMOVED v0.15.0
- Removed to control AI and storage cost. No decks, cards, review states, or due scheduling. Revision uses Note, Test Attempt incorrect review, and Syllabus Checklist entities.

## 8. Timetable
- Weekly template: semester, day of week, period order, start and end time, subject, faculty name display-only with classroom. No staff login.
- Date exception: specific date, exception type (subject change, period change, extra, cancelled, rescheduled, classroom change, holiday), linked template period if any, restore flag.

## 9. Attendance
- Record: date, period reference, subject, status (Present, Absent, Unmarked), exception linkage.
- Target: student, subject or overall scope, percentage goal.
- Derived values: subject percentage, overall percentage, missed count, recovery estimate. Recalculated on timetable or record change.

Integrity rule: cancelled and holiday periods must not create absence records.

## 10. Engagement Entities (Phase 2+, listed for completeness)
- Career goal, milestone, skill gap entry.
- Event, opportunity, bookmark, registration.
- Team, membership, invitation, task, activity update.
- Community, post, comment, report (approved as Phase 3 prerequisite).
- Notification preference and delivery log.

## 11. Annotation (approved)
- Owner, target file and page anchor, highlight range, note text, created and updated timestamps.

## Open Decisions
- Regulation versioning for subjects (for example, syllabus revisions).
- File retention periods per bucket to be confirmed with counsel, then erasure at purpose end per COMPLIANCE-DPDP.md Section 7.
- Long-answer evaluation workflow (manual, AI-assisted, or deferred).
