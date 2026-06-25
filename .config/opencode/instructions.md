# Global Instructions

These rules apply to every project, file, and session unless a more specific instruction
overrides them. When two rules conflict, the more specific one wins. When an explicit user
request conflicts with a default below, follow the user.

## Priority Tiers

- **Tier 1 — Hard constraints (never break):** Backward Compatibility, useEffect,
  Modern JavaScript, Code Language, Re-Exports.
- **Tier 2 — Workflow:** Error Handling, Accuracy & Verification, Git.
- **Tier 3 — Defaults & preferences:** Language, Tooling, Testing, Dates, Documentation,
  Comments.

---

## Tier 1 — Hard Constraints

### No Backward Compatibility
Write only the clean, final version of the code, as if the previous version never existed.
No legacy fallbacks, migration shims, dual-key reads, value mapping from old formats, or
"try new then old" branches. When a key, schema, or enum changes, update every usage
directly.

```ts
// Avoid
const value = data.newKey ?? data.oldKey
// Prefer
const value = data.newKey
```

### No useEffect
Never use `useEffect`; there is always a better alternative. Prefer server components,
loaders, actions, event handlers, `useSyncExternalStore`, `useMemo`, derived state, or ref
callbacks. When editing code that contains `useEffect`, refactor it to a proper alternative.

```tsx
// Avoid
useEffect(() => { setFullName(`${first} ${last}`) }, [first, last])
// Prefer
const fullName = `${first} ${last}`
```

### Modern JavaScript Only
Never use classical index loops. Use `for...of`, `.map`, `.filter`, `.reduce`, `.forEach`,
`.flatMap`, `.find`, `.some`, `.every`, and similar. For an index, use `array.entries()`.
For a range, use `Array.from`. Refactor classical loops whenever you touch them.

```ts
// Avoid
for (let i = 0; i < items.length; i++) { handle(items[i]) }
// Prefer
for (const item of items) handle(item)
for (const [index, item] of items.entries()) handle(index, item)
Array.from({ length: n }, (_, i) => i)
```

### Code Language Is English
All code content is English: identifiers, strings, prompts, logs, error messages, JSDoc,
type names, enum values, and constants. The only exception is when the user explicitly asks
for German content in code.

### No Re-Export Files
Every module contains its own implementation; no barrel or proxy files. Import directly from
the source module. When you find a re-export file, delete it and repoint every import to the
source.

---

## Tier 2 — Workflow

### Error Handling
Never leave an error unaddressed, including pre-existing ones you discover while reading,
building, or testing — "it was already broken" is not a reason to skip a fix. Treat
compilation, type, lint, test, and runtime errors as blockers and fix all of them. If a fix
is genuinely out of scope or needs a decision, say so explicitly and ask how to proceed
rather than moving on silently.

### Accuracy & Verification
Do not assume or invent details. If you are not certain about an API, path, signature, or
configuration, verify first by reading files, searching the codebase (Grep, Glob, Read), or
checking documentation. If you still cannot confirm it, state the uncertainty and ask
instead of guessing.

### Git
- Run `git` from the working directory. Never use `git -C <path>`.
- Use `git --no-pager` for `diff`, `log`, and `show`.
- Never commit automatically or as a side effect of another task. Commit only when the user
  explicitly asks.
- For commits, follow the `/commit` command, which defines message format, Gitmoji usage,
  and commit splitting. The Gitmoji table lives in `~/.config/opencode/gitmoji.md`.

---

## Tier 3 — Defaults & Preferences

### Language
Always respond to the user in German.

### Package Manager & Runtime
Use `bun` as both package manager and runtime: `bun install`, `bun add`, `bun remove`,
`bun run <script>`, and `bunx`. Do not use `npm`, `yarn`, or `npx`.

### Testing
Run tests with `bun run test` (Vitest via package.json). Never use `bun test`, which runs
Bun's built-in runner and is incompatible with Vitest APIs (`vi.mocked`, `vi.stubEnv`, mock
hoisting, etc.).

### Dates & Times
Use `date-fns` (`format`, `parseISO`, `addDays`, `differenceInDays`, etc.) rather than
native `Date` methods for anything non-trivial.

### Documentation Lookup
Use the Context7 MCP server for library and framework docs: call `resolve-library-id`
first, then `query-docs`. Prefer current documentation over training-data recall.

### Code Comments
Code should be self-explanatory, so do not add inline, block, or TODO comments. The only
exception is JSDoc/docstrings on functions describing purpose, parameters, and return value.
