# ADR-0002: Adopt FastAPI Backend Framework

Date: 2026-05-20

Status: Accepted

Owners:

- Platform Engineering

Reviewers:

- Repository Maintainer

Approvers:

- Repository Maintainer

Related ADRs:

- ADR-0001 Record Architectural Decisions

---

## Summary

### Problem Statement

The platform requires a backend framework capable of supporting AI provider integration, request validation, maintainability, and future platform growth.

### Decision Outcome

Adopt FastAPI as the backend framework.

### Status

Accepted.

---

## Context

The backend responsibilities include:

- AI provider orchestration
- interview generation requests
- persistence layer integration
- validation logic
- future authentication support
- analytics support

Requirements prioritize:

- maintainability
- typed interfaces
- asynchronous execution capability
- API documentation support

---

## Requirements

### Functional Requirements

1. REST API capability

2. Validation support

3. OpenAPI compatibility

4. Database integration capability

### Non-Functional Requirements

1. Maintainability

2. Type safety

3. Performance

4. Operational simplicity

---

## Decision

Adopt FastAPI.

Backend implementation location:

[`apps/api/`](/apps/api/)

---

## Rationale

FastAPI provides:

- request validation
- automatic OpenAPI generation
- typed interfaces
- asynchronous execution support

The framework aligns with platform requirements while maintaining operational simplicity.

Typed validation reduces integration inconsistencies between frontend and backend systems.

---

## Alternatives Considered

### Flask

Advantages:

- simplicity
- ecosystem maturity

Disadvantages:

- weaker typed interface integration

Decision rationale:

Rejected due to maintainability requirements.

---

### Django

Advantages:

- mature ecosystem
- extensive features

Disadvantages:

- broader framework scope than required

Decision rationale:

Rejected because requirements do not justify framework complexity.

---

## Consequences

### Positive

- maintainable API development

- typed request validation

- automatic API documentation

### Negative

- framework adoption learning effort

### Tradeoffs

Framework capabilities increase maintainability while introducing technology adoption overhead.

---

## Implementation Notes

Backend location:

[`apps/api/`](/apps/api/)

Primary backend dependencies:

```txt
fastapi

uvicorn

sqlalchemy

alembic

psycopg
```

Validation workflow:

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)

Quality requirements:

1. lint validation

2. type validation

3. tests

---

## Operational Considerations

API schema generation remains automatic.

Validation failures return structured API responses.

---

## Review / Approval Process

Approval required from:

- Repository Maintainer

---

## Future Reassessment Triggers

Reevaluate framework selection if operational constraints materially change.

---

## Status Change History

| Date | Previous Status | New Status | Reason |
|-------|-----------------|------------|---------|
| 2026-05-20 | Proposed | Accepted | Backend framework approved |

---

## References

Implementation artifacts:

[`apps/api/`](/apps/api/)

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)