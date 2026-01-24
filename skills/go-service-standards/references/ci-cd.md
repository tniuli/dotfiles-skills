# CI/CD checklist

## CI pipeline
- Lint: `gofmt`, `goimports`, `go vet`, `staticcheck`, `golangci-lint`.
- Test: `go test ./...` and `-race` when possible.
- Security: `govulncheck ./...` and dependency scanning if available.
- Build: `go build ./...` and container build (if applicable).

## CD pipeline
- Version artifacts (tagged builds, SBOM if required).
- Run database migrations safely (forward-only, idempotent where possible).
- Support rollback or blue/green deployment.
- Publish release notes and change log entries.
