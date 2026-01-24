# HTTP frameworks

## Selection guidance
- Default to `net/http` or `chi` for minimal dependencies and clarity.
- Use `gin` only if its middleware ecosystem is required.

## Integration notes
- Always set `ReadHeaderTimeout`, `ReadTimeout`, `WriteTimeout`, and `IdleTimeout` on `http.Server`.
- Use middleware for request id, logging, recovery, and metrics.
- Keep handlers thin; delegate to domain services in `internal/`.
