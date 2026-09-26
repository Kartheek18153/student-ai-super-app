# Compliance — DPDP Build-Now Guide (Specification Only, No Code)

Version: 0.20.0-approved | Date: 2026-09-21 | Status: Agent-ready freeze, read-only, no ID files

Plain-English overview for founders. Not legal advice. Check the DPDP Act 2023, DPDP Rules 2025, commencement notification, and legal counsel for your exact product and launch date.

Timing note: India is bringing the law into force in stages. Most day-to-day duties below are scheduled for 13 May 2027. Some provisions started earlier. Read this as a build-now guide so the MVP is ready, not a claim that every duty applies today.

Vision list `student-ai-super-app-complete-feature-list.md` not modified.

## 1. Roles in This App

- Business as Data Fiduciary: the app decides why and how student personal data is used, for example profile, college ID, marks, assignments, uploads, attendance, AI notes history.
- Student as Data Principal: the person whose data it is.
- Supabase and AI and email and push vendors as Data Processors: they process personal data for the app under contract. The app remains responsible even when a vendor does the processing.
- Consent Manager: a registered service that helps people give, manage, review and withdraw consent. This app does not become one by showing a consent box.

References: Act sections 2(g), 6(7)-(9), 8(1); Rules rule 4.

## 2. Lawful Grounds Before Any Use

- Need a lawful ground to use digital personal data: consent or a use allowed by section 7.
- Section 7 cases are specific, not general permission. Example: an email given for an order receipt is used for that receipt.
- MVP rule: collect purpose at collection time, store purpose with the record, use only for that purpose unless a new ground is recorded.

References: Act sections 4 and 7.

## 3. Processor Contracts (Supabase and Others)

- Use a valid contract with every processor before sending personal data.
- Contract covers security, access limits, sub-processing, breach cooperation, retention and deletion, audit support.
- Applies to cloud hosting, file storage, analytics if added, email and push vendors, AI orchestration vendor.
- MVP checklist item in ROADMAP.md Phase 0: confirm processor terms and access controls before production student data.

References: Act section 8(2); Rules rule 6(1)(f).

## 4. Accuracy

- Keep data accurate, complete and consistent when used to make a decision about a person or shared with another fiduciary.
- MVP touchpoints: CGPA calculation inputs, attendance percentages and recovery estimates, reviewer decisions, exported records.
- Provide edit flows for profile, marks, assignments, timetable. Log corrections for decisions already shown.

Reference: Act section 8(3).

## 5. Security Safeguards and People Plus Process

- Protect personal data against breaches with reasonable safeguards.
- Rules name measures such as encryption or masking, access controls, monitoring and backups. Implement as principles, no code in this doc:
  - Encryption in transit and at rest, masking of college ID outside verification task context.
  - Least-privilege access: only support and reviewer roles who need account details can see them. Review access periodically.
  - Monitoring of auth failures, storage errors, job runs. Backups with tested restore.
  - Owner-only private buckets plus approval-gated shared buckets per SUPABASE-PLAN.md Section 4.
- Technical plus organisational: named owners for access reviews and incident response.

References: Act sections 8(4), 8(5); Rules rule 6, 6(1)(g).

## 6. Breach Notification

- If a breach happens: tell affected students without delay, notify the Data Protection Board. Rules call for a more detailed Board update within 72 hours unless extended.
- MVP readiness: keep breach facts and decisions documented, prepare user message templates and Board report inputs during investigation, keep logs without student content.
- Roles: incident owner, communications owner, Board reporting owner to be named before launch.

References: Act section 8(6); Rules rule 7.

## 7. Retention and Purpose End

- Do not keep personal data after purpose ends, subject to legal retention duties and the Rules.
- MVP defaults to be confirmed with counsel:
  - Active study data kept for active account plus defined academic history window.
  - Personal uploads do not exist in read-only model. Annotations and exports deleted or anonymized on account delete, subject to safety audit retention.
  - Backups age out on rotation schedule.
- Store retention category with each entity in DATA-MODEL-SPEC.md. Erasure on purpose end, not cheap-storage hoarding.

References: Act section 8(7); Rules rule 8.

## 8. Children

- Child is under 18 under this Act. Processing generally needs verifiable parental consent. Tracking, behavioural monitoring and targeted ads to children face restrictions, with stated exemptions.
- This app targets college students who may include 17-year-olds in first year. MVP includes age gate and parent-consent flow before collecting a suspected child account data.
- No behavioural ads to children. No tracking beyond what is needed for the learning purpose.

References: Act section 9; Rules rules 10 and 12.

## 9. Principal Rights in MVP

- Right to access: student can ask what personal data is processed and how it has been shared, subject to the Act. Provide export of profile, notes, attempts, attendance history plus sharing list. No decks. No ID files collected.
- Grievance redressal: working in-app privacy contact, routed to someone who can answer, published response period capped at 90 days per Rules.
- Right to nominate: student can record a nominee to exercise rights if they die or become incapable. Optional field in account settings.
- Consent withdrawal and purpose objection handled through same request channel as access.

References: Act sections 11, 13, 14; Rules rules 9, 14(3), 14(4).

## 10. Cross-Border and Growth Oversight

- Cross-border transfers generally allowed subject to government restrictions. Some data of Significant Data Fiduciaries may face extra limits. Check where foreign analytics, cloud, AI providers handle Indian user data.
- Significant Data Fiduciary label applies only if government notifies the business or class based on volume and risk. Watch for notification before assuming it fits.
- If notified as SDF: appoint India-based Data Protection Officer responsible to board and as complaint contact, run Data Protection Impact Assessment every 12 months, appoint independent auditor every 12 months.
- Board: Data Protection Board of India handles complaints and breaches and can decide penalties. Maximum for failing reasonable security safeguards is Rs 250 crore. Amount not automatic. Keep facts and decisions documented.

References: Act sections 10, 10(2)(a)-(c), 16, 18, 27, 33 and Schedule; Rules rules 13(1), 13(4), 15.

## 11. MVP Compliance Checklist (Mirrors ROADMAP.md Phase 0)

- Purposes recorded at collection, consent or section 7 ground noted.
- Processor contracts reviewed for Supabase, email, push, AI orchestration.
- Access review owners named, college ID masking rule applied.
- Backup and restore tested, monitoring without student content in logs.
- Breach playbook with without-delay user notice and 72-hour Board update path.
- Retention categories set, erasure on purpose end.
- Age gate plus verifiable parental consent flow for under-18.
- Access export, 90-day grievance contact, nominee field.
- Transfer map for any foreign provider region.
- SDF watch log. If notified: DPO, yearly DPIA, yearly audit.

## 12. Change Impact

- SUPABASE-PLAN.md Section 8 points to this guide.
- ARCHITECTURE-PLAN.md Section 4 adds DPDP duties.
- DATA-MODEL-SPEC.md adds retention, nominee, age-verification attributes as descriptive fields.
- ROADMAP.md Phase 0 adds compliance checklist.
- PRD-MVP.md adds rights acceptance in profile and settings.
- Vision `student-ai-super-app-complete-feature-list.md` v0.9.0 applies with DPDP rights in Sections 1 and 14.
