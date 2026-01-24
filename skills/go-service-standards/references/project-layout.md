# Project layout

## Recommended structure
- `cmd/<service>/main.go`: entrypoint only; wire dependencies and start the server.
- `internal/<domain>`: non-public packages (handlers, services, repositories).
- `internal/platform`: shared infra (config, logging, metrics, tracing, db, cache).
- `pkg/<library>`: reusable public libraries only; omit if unused.
- `api/`: OpenAPI specs or protobuf definitions.
- `config/`: default config files or examples; keep secrets out.
- `scripts/`: dev scripts and tooling helpers.

## Conventions
- Keep `main` thin; move logic to `internal` packages.
- Keep package names short and specific; avoid catch-all `utils` packages.
- Place interfaces near the code that consumes them.
- Prefer dependency injection via constructors; avoid global singletons.
- Keep transport (HTTP/gRPC) separate from domain logic.
