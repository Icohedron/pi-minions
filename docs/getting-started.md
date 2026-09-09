# Getting started

This tutorial walks through foreground minion delegation in pi.

## 1. Spawn one foreground minion

```text
/spawn Read src/index.ts and summarize the registered tools
```

The parent waits for the minion result. Progress is streamed while the minion runs. For the tool-call shape, see the [spawn reference](reference.md#spawn).

## 2. Spawn a batch of foreground minions

Use the LLM-callable `spawn` tool with multiple task entries when subtasks are independent:

```ts
spawn({
  tasks: [
    { task: "Review src/tools for public API changes" },
    { task: "Review test/tools for coverage gaps" }
  ]
})
```

The tasks run concurrently in isolated foreground sessions and the parent receives a combined result.

## 3. Pick named agents

List available named agents before choosing one:

```ts
list_agents({})
spawn({ tasks: [{ task: "Compare two implementation options", agent: "researcher" }] })
```

For agent defaults and ephemeral minions, see [Agents](agents.md).

## 4. Inspect foreground activity

```text
/minions
/minions show kevin
```

The default `/minions` command opens the live activity view for the first running minion. `/minions show <id|name>` opens a specific minion.

The LLM-callable equivalents are:

```ts
list_minions({})
show_minion({ target: "kevin" })
```

## 5. Halt a running minion

```text
/halt kevin
```

Or from a tool call:

```ts
halt({ id: "all" })
```

## 6. Learn the surface in-session

```text
/minions learn
/minions skill
```

Or:

```ts
learn_minions({})
```

The built-in skill text is packaged in source so users can learn the extension without packaged docs.
