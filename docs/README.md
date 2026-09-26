# Student AI Super-App — Documentation Index

## Vision
A comprehensive student platform covering exam preparation, AI-powered learning, attendance tracking, career development, student communities, events, and personal productivity.

Core student journey:
Learn → Practice → Test → Identify Weaknesses → Improve → Track Attendance → Develop Skills → Build Projects → Find Teammates → Discover Opportunities → Prepare for a Career

## Source of Truth
- Existing vision list: `student-ai-super-app-complete-feature-list.md` v0.19.0
  - Last approved edit v0.19.0 read-only users, maintainer seeds all, no uploads. Prior v0.15.0 flashcards removal, v0.10.0 formula, v0.9.0 student-only + P0 + DPDP rights. Further edits need explicit user approval.
  - All new documentation references it but does not duplicate it verbatim.

## Documentation Set (Approved 2026-09-21)

| File | Purpose |
|------|---------|
| `README.md` | Overview, vision, doc index (this file) |
| `PRD-MVP.md` | MVP scope, user stories, acceptance criteria, out-of-scope |
| `FEATURE-GAPS.md` | Proposed enhancements, missing features, duplicates to resolve. Proposals only — requires approval before applying to vision list |
| `ARCHITECTURE-PLAN.md` | Module boundaries, user roles, integrations, non-functional requirements. Plan only, no implementation |
| `DATA-MODEL-SPEC.md` | Entities, attributes, relationships described in tables. Specification only |
| `ROADMAP.md` | Phased delivery plan: Phase 0 Supabase setup, Phase 1 MVP, Phase 2, Phase 3 |
| `SUPABASE-PLAN.md` | Approved backend plan: Auth, database mapping, storage buckets, access principles, ops. Spec only, no code |
| `COMPLIANCE-DPDP.md` | DPDP build-now guide: fiduciary duties, breach, retention, children, rights, transfers, SDF watch. Spec only, not legal advice |
| `FOUNDER-STARTUP-GAPS.md` | First-time founder gaps: users, content, money, legal beyond DPDP, launch, metrics, owners. Spec only |
| `SERVICES-INDIA.md` | India MVP services catalog: required services, India constraints, out-of-scope, open choices. Spec only, no code |
| `AI-FEATURES.md` | AI features catalog: materials, notes, tests, doubts, cross-cutting rules, cost tiers. Flashcards removed. Spec only, no code |
| `AGENT-START-HERE.md` | Agent-ready build order: read order, frozen scope, Phase 0-1 steps, open decisions, guardrails. Spec only, no code |
| `DOCUMENTATION-GUIDE.md` | Consistency rules and approval workflow |

## Workflow Rules
1. Docs-only mode: create and maintain `.md` files only. No code generation.
2. No modification of existing files without explicit user approval.
3. Propose changes first in `FEATURE-GAPS.md` or chat, explain why needed, wait for approval, then update docs.
4. Keep all docs consistent when requirements change. COMPLIANCE-DPDP.md is authoritative for DPDP.

## Status
- Version: 0.20.0-approved
- Last updated: 2026-09-21
- State: Agent-ready freeze. Start at AGENT-START-HERE.md. Read-only first-year-free MVP.
