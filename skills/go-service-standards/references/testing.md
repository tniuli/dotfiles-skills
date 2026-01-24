# Testing strategy

## Unit tests
- Use table-driven tests for pure functions and small components.
- Mock external dependencies behind interfaces near the caller.
- Keep tests deterministic; avoid time and randomness without control.

## Integration tests
- Cover DB/cache/message broker integration paths.
- Prefer ephemeral containers or dedicated test instances if available.
- Reset state between tests; avoid order dependency.

## End-to-end tests
- Exercise the service API at the transport boundary.
- Use realistic payloads and verify critical user journeys.

## Performance and load
- Add load tests for SLO-critical endpoints.
- Capture baseline latency and error rate.
