# Coding standards

## General Go practices
- Keep `main` thin; push logic into `internal` packages.
- Prefer explicit dependencies via constructors; avoid global singletons.
- Keep package APIs small and cohesive; avoid `utils` packages.

## Context and cancellation
- Accept `context.Context` as the first parameter for request-scoped functions.
- Propagate context to all outbound calls and goroutines.
- Enforce timeouts at boundaries; avoid `context.Background()` inside handlers.

## Error handling
- Wrap errors with `%w` for context and use `errors.Is/As` for checks.
- Use typed or sentinel errors for control flow, not string matching.
- Do not expose internal errors directly to external clients.

## Concurrency
- Avoid goroutine leaks; always have cancellation or completion paths.
- Use `errgroup` for coordinated goroutines.
- Keep shared state minimal; protect with `sync` primitives.

## API design
- Validate input at the boundary.
- Return clear, stable error codes for clients.
- Keep request/response models versioned if changes are expected.
