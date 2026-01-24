# Quality gates

## Formatting and style
- Run `gofmt` and `goimports` on all Go files.
- Enforce `golangci-lint` (or at least `go vet` + `staticcheck`).

## Static analysis and security
- Run `go vet ./...` and `staticcheck ./...`.
- Run `govulncheck ./...` on CI for known CVEs.

## Tests
- Run `go test ./...` on every change.
- Run `go test -race ./...` at least in CI nightly or on main branch.
- Set a coverage threshold (start with 70%+ for new code; adjust per team policy).

## Module hygiene
- Run `go mod tidy` and keep `go.sum` updated.
- Avoid `replace` directives in released builds unless documented.

## Build
- Build with `-trimpath` for reproducibility.
- Keep `GOFLAGS` and build tags documented if used.
