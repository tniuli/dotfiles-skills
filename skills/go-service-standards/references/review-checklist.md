# Review checklist

## Architecture and correctness
- Does the change keep transport logic separate from domain logic?
- Are inputs validated at the boundary and errors mapped consistently?
- Are timeouts and retries intentional and justified?

## Reliability and operations
- Are logging, metrics, and tracing updated for new flows?
- Are health/readiness signals accurate for new dependencies?
- Is graceful shutdown preserved with new goroutines or servers?

## Security
- Are auth and authorization enforced where needed?
- Are secrets and sensitive data kept out of logs and errors?
- Are external calls bounded with timeouts and limits?

## Quality gates
- Are tests added or updated for the change?
- Does the change pass lint, staticcheck, and `govulncheck`?
- Is module hygiene preserved (`go.mod`, `go.sum` tidy)?
