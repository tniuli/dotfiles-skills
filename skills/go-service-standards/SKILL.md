---
name: go-service-standards
description: General Go service engineering standards for backend services. Use when building, refactoring, or reviewing Go services that require strict practices (project layout, coding standards, configuration, observability, error handling, testing, CI/CD, security, dependency management, release).
---

# Go Service Standards

## Overview
Use this skill to design, implement, or review general Go services with strict engineering practices. Follow the workflow, then consult the references for detailed checklists and patterns.

## Workflow
### 1) Clarify scope and constraints
- Ask for protocol (HTTP/gRPC), deployment target, and SLOs.
- Confirm auth, data stores, external dependencies, and compliance requirements.
- If constraints are not provided, apply default assumptions (see `references/defaults.md`).

### 2) Establish structure and quality gates
- Apply the standard project layout (see `references/project-layout.md`).
- Apply the coding standards baseline (see `references/coding-standards.md`).
- Define lint/test gates and module hygiene (see `references/quality-gates.md`).
- Capture minimal operational docs (README, runbook, ownership).

### 3) Build service skeleton
- Implement config loading, structured logging, metrics, tracing, health checks, and graceful shutdown.
- Use `references/observability.md`; for protocol specifics, read `references/http-frameworks.md` or `references/grpc.md`.

### 4) Implement business logic with reliability
- Enforce context timeouts, input validation, and error wrapping.
- Apply retries/timeouts intentionally; avoid hidden global state.
- Apply the security checklist (see `references/security.md`).

### 5) Verify and release
- Write unit and integration tests; add load tests for SLO-sensitive paths (see `references/testing.md`).
- Set up CI/CD with static analysis and test gates (see `references/ci-cd.md`).
- Ensure migration and rollback plans exist before release.
- Use the review checklist during code review (see `references/review-checklist.md`).

## Reference map
- `references/project-layout.md`: standard directory layout and module boundaries.
- `references/coding-standards.md`: baseline Go coding standards for services.
- `references/quality-gates.md`: formatting, linting, static analysis, and test gates.
- `references/defaults.md`: default assumptions for CI, tooling, deployment, observability, security, release.
- `references/observability.md`: logging, metrics, tracing, health, shutdown patterns.
- `references/testing.md`: unit/integration/e2e strategy and test data guidance.
- `references/ci-cd.md`: pipeline steps and required checks.
- `references/security.md`: secure defaults and common pitfalls.
- `references/review-checklist.md`: code review checklist for reliability and maintainability.
- `references/http-frameworks.md`: HTTP framework selection and integration notes.
- `references/grpc.md`: gRPC server/client patterns, interceptors, proto hygiene.
