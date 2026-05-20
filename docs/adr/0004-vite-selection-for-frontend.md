# ADR-0004: Select Vite for Frontend Application

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

The platform requires a web interface that communicates with the backend API while remaining maintainable, performant, and operationally simple.

The selected frontend technology must support current requirements while allowing future growth without introducing unnecessary architectural complexity.

### Decision Outcome

Adopt:

- React
- TypeScript
- Vite

for frontend implementation.

### Status

Accepted.

---

## Context

The platform allows users to generate interview questions by submitting role information to an AI-backed backend service.

Frontend responsibilities include:

- interview generation interface
- request parameter configuration
- generated question visualization
- history retrieval
- account management
- future analytics capabilities

Current platform characteristics:

- authenticated application workflows
- API-driven architecture
- independently deployed backend
- no search engine optimization requirement
- no server-side rendering requirement

### Functional Requirements

1. API integration capability

2. Type safety

3. Component-based development model

4. Efficient local development workflow

5. Independent frontend deployment

### Non-Functional Requirements

1. Maintainability

2. Operational simplicity

3. Fast feedback during development

4. Minimal framework overhead

---

## Decision

Adopt React with TypeScript using Vite as the frontend build and development platform.

---

## Rationale

### React

React provides:

- component isolation
- ecosystem maturity
- predictable composition patterns
- maintainable interface organization

The application behaves primarily as a user-facing operational interface rather than a content publishing platform.

React aligns well with this usage model.

### TypeScript

TypeScript improves:

- API contract consistency
- refactoring confidence
- editor tooling quality
- runtime defect prevention

The backend architecture already emphasizes typed interfaces.

Maintaining typing discipline across frontend and backend reduces integration inconsistencies.

### Vite

Vite provides:

- rapid local startup
- fast incremental rebuilds
- low configuration overhead
- modern JavaScript tooling support

The platform currently operates as an application rather than a search-oriented website.

Capabilities such as server-side rendering would increase operational complexity without solving current platform requirements.

---

## Alternatives Considered

### Next.js

Advantages:

- server-side rendering
- static generation
- middleware capabilities

Disadvantages:

- increased operational complexity
- larger framework surface area
- additional deployment considerations

Decision rationale:

Rejected because current requirements do not justify framework complexity.

Future migration remains possible.

---

### Plain React Without Build Standardization

Advantages:

- lower conceptual overhead

Disadvantages:

- weaker development tooling
- inconsistent optimization capability

Decision rationale:

Rejected due to maintainability concerns.

---

## Consequences

### Positive

- faster frontend iteration
- maintainable architecture
- improved developer productivity
- reduced operational complexity

### Negative

- server-side rendering unavailable

### Tradeoffs

The selected approach optimizes operational simplicity over rendering flexibility.

---

## Implementation Notes

Frontend implementation:

[`apps/web/`](/apps/web/)

Primary dependencies:

```txt
react
typescript
vite
tailwindcss
@tanstack/react-query
zod
```

Validation pipeline:

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)

Required validation:

1. lint validation

2. type validation

3. tests

4. build verification

---

## Operational Considerations

Deployment remains independent from backend deployment.

Frontend failures should not directly impact backend availability.

Build verification remains mandatory before merge approval.

---

## Review / Approval Process

Approval required from:

- Repository Maintainer

Review requirements:

- architecture validation
- operational impact validation

---

## Future Reassessment Triggers

Reevaluate this decision if:

- search engine indexing becomes required

- public content pages become primary platform capability

- rendering requirements become substantially more complex

---

## Status Change History

| Date | Previous Status | New Status | Reason |
|-------|-----------------|------------|---------|
| 2026-05-20 | Proposed | Accepted | Frontend technology approved |

---

## References

Related implementation artifacts:

[`apps/web/`](/apps/web/)

[`.github/workflows/ci.yml`](/.github/workflows/ci.yml)