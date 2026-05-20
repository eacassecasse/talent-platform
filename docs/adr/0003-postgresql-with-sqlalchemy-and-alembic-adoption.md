# ADR-0003: Adopt PostgreSQL with SQLAlchemy and Alembic

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
- ADR-0002 Adopt FastAPI Backend Framework

---

## Summary

### Problem Statement

The platform requires durable storage for operational data while supporting maintainability, schema evolution, and future growth.

### Decision Outcome

Adopt:

- PostgreSQL
- SQLAlchemy
- Alembic

for persistence architecture.

### Status

Accepted.

---

## Context

The platform stores:

- users
- interview generation history
- generated questions
- provider usage metadata
- future analytics information

Storage requirements include:

- relational consistency
- maintainability
- predictable schema evolution
- transactional guarantees

---

## Requirements

### Functional Requirements

1. Relational storage capability

2. Schema migration support

3. Transaction support

4. Future analytics compatibility

### Non-Functional Requirements

1. Reliability

2. Maintainability

3. Ecosystem maturity

4. Operational stability

---

## Decision

Adopt:

Database:

```txt
PostgreSQL
```

Persistence abstraction:

```txt
SQLAlchemy
```

Schema evolution:

```txt
Alembic
```

---

## Rationale

### PostgreSQL

Provides:

- transactional guarantees
- indexing capabilities
- ecosystem maturity

Platform requirements align strongly with relational modeling.

### SQLAlchemy

Provides:

- model abstraction
- relationship management
- transaction handling

Persistence logic remains separated from business logic.

### Alembic

Provides:

- version-controlled schema evolution
- rollback capability
- deployment consistency

---

## Alternatives Considered

### PostgreSQL with Raw SQL

Advantages:

- direct control

Disadvantages:

- higher maintenance complexity

Decision rationale:

Rejected due to maintainability concerns.

---

### SQLModel

Advantages:

- simpler abstraction model

Disadvantages:

- ecosystem maturity lower than SQLAlchemy

Decision rationale:

Rejected due to long-term maintainability considerations.

---

### NoSQL-first approach

Advantages:

- schema flexibility

Disadvantages:

- weaker relational alignment

Decision rationale:

Rejected because platform requirements remain primarily relational.

---

## Consequences

### Positive

- maintainable persistence layer

- predictable schema evolution

- ecosystem stability

### Negative

- migration maintenance overhead

### Tradeoffs

Operational discipline increases while reducing long-term persistence complexity.

---

## Implementation Notes

Database configuration:

[`apps/api/`](/apps/api/)

Migration location:

[`apps/api/alembic/`](/apps/api/alembic/)

Dependencies:

```txt
sqlalchemy

alembic

psycopg
```

Validation:

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)

---

## Operational Considerations

Schema modifications remain migration-driven.

Manual production schema modifications remain prohibited.

Deployment flow:

1. deploy application

2. execute migration

3. validate application health

---

## Review / Approval Process

Approval required from:

- Repository Maintainer

---

## Future Reassessment Triggers

Reevaluate persistence architecture if relational storage requirements materially change.

---

## Status Change History

| Date | Previous Status | New Status | Reason |
|-------|-----------------|------------|---------|
| 2026-05-20 | Proposed | Accepted | Persistence architecture approved |

---

## References

Implementation artifacts:

[`apps/api/`](/apps/api/)

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)