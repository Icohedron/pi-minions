# Reference

## Tools

| Tool | Purpose |
|---|---|
| `spawn` | Run one or more foreground minions and wait for results |
| `halt` | Abort a running foreground minion by id, name, or `all` |
| `list_agents` | List available named agents plus the built-in ephemeral minion when enabled |
| `list_minion_types` | Alias surface for listing available minion types |
| `list_minions` | List current foreground minions retained in the session tree |
| `show_minion` | Show detailed status, activity, usage, and history for one minion |
| `learn_minions` | Return built-in usage guidance |

### spawn

`tasks` is the only top-level option. It is required and must be a non-empty array of objects with a required `task` string and optional `agent` and `model` strings. Top-level `task`, `agent`, and `model` options are not supported.

- One item runs one foreground minion with a single-minion result and display, not a batch wrapper.
- Two or more items run concurrently as a batch with a combined result and batch display.

Single foreground minion:

```ts
spawn({ tasks: [{ task: "Read src/index.ts and summarize it" }] })
```

Named agent and model override for one task entry:

```ts
spawn({
  tasks: [
    { task: "Research package files", agent: "researcher", model: "claude-haiku" }
  ]
})
```

Batch foreground minions:

```ts
spawn({
  tasks: [
    { task: "Inspect source" },
    { task: "Inspect tests", agent: "tester" }
  ]
})
```

See [Agents](agents.md) for named configurations and model defaults.

### halt

```ts
halt({ id: "kevin" })
halt({ id: "all" })
```

### list_agents and list_minion_types

```ts
list_agents({})
list_minion_types({})
```

### list_minions

```ts
list_minions({})
```

Returns a text summary and details containing foreground minion id, name, task, status, agent name, model, and last activity.

### show_minion

```ts
show_minion({ target: "kevin" })
```

`target` can be a minion id or name.

### learn_minions

```ts
learn_minions({})
```

Returns the same concise skill text exposed by `/minions learn` and `/minions skill`.

## Commands

| Command | Purpose |
|---|---|
| `/spawn <task> [--model <model>]` | Ask the parent to call foreground `spawn` |
| `/minions` | Open live activity for the first running foreground minion |
| `/minions show <id\|name>` | Open live activity for a specific minion |
| `/minions list` | List available minion types |
| `/minions learn` | Show usage guidance |
| `/minions skill` | Show the built-in skill text |
| `/minions version` | Show package version |
| `/minions help` | Show command help |
| `/halt <id\|name\|all>` | Halt running foreground minions |

## Types

| Type | Key fields |
|---|---|
| `AgentConfig` | `name`, `description`, `systemPrompt`, `source`, optional `model`, `tools`, `steps`, `timeout` |
| `AgentNode` | `id`, `name`, `task`, `status`, `usage`, `activityHistory`, optional `agentName`, `model`, `error` |
| `SpawnToolDetails` | `id`, `name`, `agentName`, `task`, `status`, `usage`, `finalOutput`, optional `minions` |
