# AGENTS

pi-minions is a pi-coding-agent extension (`src/index.ts`) that adds recursive subagent orchestration — many LLM-callable tools and user commands for spawning and managing isolated in-process agent sessions (minions).

## Architecture

pi-minions is foreground-only: minions run as in-process subagent sessions tracked in an in-memory hierarchy; there is no background spawning or result queue. The canonical module map, data flow, and design decisions live in [Architecture](docs/architecture.md) — consult it instead of re-deriving the tree structure from `src/`.

## Development

| Command | Purpose |
|---------|---------|
| `npm install` | Install deps, verify toolchain (runs `prepare`) |
| `npm run dev` | Load extension into pi (debug mode) |
| `npm test` | Run unit tests (vitest) |
| `npm run test:json` | Run unit tests with JSON output (for parsing) |
| `npm run typecheck` | TypeScript type check |
| `npm run test:e2e` | Run agentic e2e tests |

Conventional commits: `feat:`, `fix:`, `chore:`, `docs:`, etc.

## Key conventions

- TypeScript strict (`tsc --noEmit` must pass)
- vitest for unit tests, agentic markdown tests for e2e
- No JSDoc — types are the documentation
- Flat `docs/` directory, no nesting
- Documentation - each concept lives in exactly one file
- Cross-reference between docs, never duplicate content
- Do NOT mix quadrants in a single doc file

## Testing

Always load `/skill:test-writer` before writing or auditing tests and follow it's guidance.

If any test run parsing tools area available, ALWAYS pass it raw JSON output with `npm run test:json` and then use the tool to parse the output

## Documentation

- [Getting started](docs/getting-started.md) — tutorial walkthrough
- [Patterns](docs/patterns.md) — how-to recipes
- [Agents](docs/agents.md) — agent creation and configuration
- [Reference](docs/reference.md) — tool/command schemas and types
- [Architecture](docs/architecture.md) — module map, data flow, design decisions
- [Configuration](docs/configuration.md) — global and project settings
- [Contributing](docs/contributing.md) — dev setup, testing, release
- [E2E testing](docs/e2e-testing.md) — writing agentic tests
- [Roadmap](docs/roadmap.md) — current foreground-only work

## Do NOT

- Edit generated files or `node_modules/`
- Duplicate content across doc files — link instead
- Mix documentation quadrants (tutorial/how-to/reference/explanation) in a single file
- Reference `tmp/research/` from user-facing docs (internal only)
