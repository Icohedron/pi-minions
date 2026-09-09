# Agents

Agents are reusable minion configurations discovered from global and project directories.

## Discovery locations

pi-minions discovers agents and minions from:

- `~/.pi/agent/agents/`
- `~/.pi/agent/minions/`
- `~/.agents/agents/`
- `~/.agents/minions/`
- `.pi/agents/`
- `.pi/minions/`
- `.agents/agents/`
- `.agents/minions/`

Project agents override global agents with the same name.

## Agent file format

```md
---
name: researcher
description: Researches a topic and reports concise findings
model: claude-haiku
---

You are a focused research minion. Return sources, findings, and risks.
```

Common frontmatter fields:

| Field | Purpose |
|---|---|
| `name` | Agent name selected by `tasks[].agent` in [`spawn`](reference.md#spawn) |
| `description` | Shown by `list_agents` |
| `displayName` | Preferred minion display name |
| `model` | Default model for this agent |
| `tools` | Optional tool allowlist |
| `thinking` | Optional thinking level |
| `steps` | Optional turn limit |
| `timeout` | Optional timeout in milliseconds |

## Use an agent

```ts
list_agents({})
spawn({ tasks: [{ task: "Compare migration options", agent: "researcher" }] })
```

Set `model` on the task entry to override the agent default for that run.

```ts
spawn({
  tasks: [
    { task: "Review the architecture", agent: "researcher", model: "claude-sonnet" }
  ]
})
```

## Ephemeral minions

If a task entry omits `agent`, pi-minions creates a built-in ephemeral minion when [`allowEphemeral`](configuration.md#allowephemeral) is enabled.
