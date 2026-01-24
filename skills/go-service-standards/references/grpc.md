# gRPC guidance

## Server setup
- Use unary and stream interceptors for logging, metrics, tracing, and auth.
- Enforce deadlines and propagate context to dependencies.

## Error handling
- Map domain errors to `status` codes consistently.
- Avoid leaking internal details in error messages.

## Protobuf hygiene
- Version APIs; avoid breaking changes.
- Use `buf` or `protoc` linting where available.
- Keep proto files in `api/` and generate into `internal/gen` or `pkg/gen`.
