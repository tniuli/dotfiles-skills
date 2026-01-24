# Security checklist

## Secrets and config
- Load secrets from environment or secret manager; never commit secrets.
- Redact secrets from logs and errors.

## Auth and access control
- Enforce authentication and authorization on every protected endpoint.
- Apply least privilege to service accounts and database users.

## Input handling
- Validate and sanitize all external input.
- Set request size limits and timeouts.

## Network and transport
- Use TLS for external and internal traffic when required.
- Enforce timeouts and circuit breakers for outbound calls.

## Dependencies
- Pin module versions and monitor CVEs.
- Run `govulncheck` regularly.
