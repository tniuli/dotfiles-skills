# Default assumptions

Use these defaults when the user does not specify constraints.

## CI system
- Assume GitHub Actions.
- Pipeline order: lint -> test -> security scan -> build -> package.
- Cache Go build and module downloads.

## Lint and static analysis
- Use `golangci-lint` with `govet`, `staticcheck`, `errcheck`, `ineffassign`, `unused`, and `gosimple` enabled.
- Use `go vet ./...` and `staticcheck ./...` as a baseline if `golangci-lint` is unavailable.

## Go version and modules
- Use the latest stable Go release available in the environment.
- Set the `go` directive in `go.mod` to that version.
- Avoid `replace` directives in released builds unless documented.

## Deployment
- Assume containerized deployment with rolling updates.
- Provide readiness and liveness checks.
- Keep configuration via environment variables or mounted config files.

## Observability
- Emit JSON logs to stdout.
- Use Prometheus-style metrics and OpenTelemetry tracing.
- Include request id and trace id in logs.

## Security and compliance
- Enforce least privilege, TLS where applicable, and strict input validation.
- Load secrets from environment or a secret manager; never commit secrets.

## Release and rollback
- Use semantic versioning and immutable artifacts.
- Use forward-only migrations with rollback by deploying the previous version.
- Prefer feature flags for risky changes.
