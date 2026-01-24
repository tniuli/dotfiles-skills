# Observability

## Logging
- Use structured logging (`log/slog`, `zap`, or `zerolog`).
- Include request id, trace id, user id (if safe), and latency fields.
- Avoid logging secrets or full payloads by default.

## Metrics
- Use Prometheus-style counters, gauges, and histograms.
- Track request count, latency, error rate, and dependency call metrics.
- Use consistent label cardinality; avoid unbounded labels.

## Tracing
- Use OpenTelemetry for distributed tracing.
- Create spans for inbound requests and key dependency calls.
- Propagate context across goroutines and clients.

## Health and readiness
- Provide `/healthz` and `/readyz` endpoints (or gRPC health service).
- Make readiness depend on critical dependencies (DB, cache).

## Graceful shutdown
- Use `http.Server`/gRPC `GracefulStop` with context timeouts.
- Drain in-flight requests and stop accepting new ones.
