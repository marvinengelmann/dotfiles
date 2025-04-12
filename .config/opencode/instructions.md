# Global Instructions

## ABSOLUTE RULE — No Backward Compatibility, No Legacy Code, No Migration Hacks
- **NEVER add backward compatibility, legacy fallbacks, migration shims, or any form of "old key/old value" support**
- ALWAYS write the clean, perfect, final version — as if the old code never existed
- No fallback reads, no value mapping from old formats, no dual-key Redis reads, no "try new then try old" patterns
- If a key/schema/enum changes, just change it everywhere. Period.
- This applies to ALL projects, ALL code, ALL time — there is ZERO chance the user wants backward compatibility
- Violating this rule is considered a **critical error**

## ABSOLUTE RULE — No useEffect
- **NEVER use `useEffect`** — there is ALWAYS a better alternative
- Use framework-native solutions: server components, loaders, actions, event handlers, `useSyncExternalStore`, `useMemo`, derived state, refs with callbacks, etc.
- If you encounter existing `useEffect` in code you're editing, **refactor it immediately** to a proper alternative
- This applies to ALL projects, ALL code, ALL time
- Violating this rule is considered a **critical error**

## ABSOLUTE RULE — Modern JavaScript Only, No Classical For Loops
- **NEVER use classical `for (let i = 0; i < ...; i++)` loops**
- ALWAYS use modern iteration: `for...of`, `.map()`, `.filter()`, `.reduce()`, `.forEach()`, `.flatMap()`, `.find()`, `.some()`, `.every()`, etc.
- If you need the index, use `for (const [index, item] of array.entries())`
- If you need to iterate a range, use `Array.from({ length: n }, (_, i) => ...)` or a utility
- This applies to ALL code — new code AND existing code you touch
- When you encounter a classical for loop in code you're editing, **refactor it immediately**
- Violating this rule is considered a **critical error**

## Language
- **ALWAYS respond to the user in German only**

## Code Language — ABSOLUTE RULE
- **NEVER write German text in code** — ALL code content MUST be in English at all times
- This applies to: variable names, function names, strings, prompts, log messages, error messages, comments, JSDoc, type names, enum values, constants — EVERYTHING in code files
- This is a **GLOBAL rule** that applies to ALL projects, not just specific ones
- The **ONLY exception** is when the user EXPLICITLY requests German content in code
- Violating this rule is considered a critical error

## Package Manager & Runtime
- **ALWAYS use `bun` as the package manager AND runtime**
- Use `bun install`, `bun add`, `bun remove`, etc.
- Use `bun run <script>` for package.json scripts
- Use `bunx` instead of `npx` for one-off package execution
- Never use `npm`, `yarn`, or `npx` commands

## Testing
- **ALWAYS use `bun run test` to run tests** (invokes Vitest via package.json script)
- **NEVER use `bun test`** — that invokes Bun's built-in test runner which is incompatible with Vitest APIs (vi.mocked, vi.stubEnv, mock hoisting, etc.)

## Date and Time Handling
- **ALWAYS use `date-fns` library for all date and time operations**
- Never use native JavaScript Date methods for complex date operations
- Prefer date-fns functions like `format`, `parseISO`, `addDays`, `differenceInDays`, etc.

## Documentation Lookup
- **ALWAYS use the Context7 MCP server for documentation searches**
- When looking up library docs, API references, or framework documentation, use `resolve-library-id` first, then `query-docs`
- Never rely on potentially outdated training data when current documentation is available via Context7

## Re-Exports — ABSOLUTE RULE
- **NEVER create re-export files** (files that only re-export from another module)
- Every module must contain its own implementation — no proxy/barrel files
- Import directly from the source module, not through an intermediary
- If you find an existing re-export file, **delete it** and update all imports to point to the source
- Violating this rule is considered a **critical error**

## Code Comments
- **NEVER write comments in code** — code should be self-explanatory
- The **only exception** is JSDoc/docstring comments for functions (describing purpose, parameters, return values)
- Do not add inline comments, block comments, or TODO comments

## Error Handling Policy
- **NEVER ignore errors** — if you encounter or discover ANY error during your work (compilation errors, type errors, test failures, linting issues, runtime errors, etc.), you MUST fix ALL of them before continuing
- This applies to ALL errors, including pre-existing ones — "it was already broken before" is NEVER an acceptable excuse to skip a fix
- If you find errors while reading code, running tests, or building the project, treat them as blockers and fix every single one
- Do NOT silently move on after encountering errors — always address them explicitly
- If fixing an error is genuinely outside the current scope or requires user input, explicitly inform the user and ask how to proceed — never just ignore it

## Accuracy and Verification
- **NEVER make assumptions or invent information**
- If you are not 100% certain about something (API usage, configuration, file paths, etc.), ALWAYS verify first by:
  - Reading relevant files
  - Checking documentation
  - Searching the codebase
  - Using appropriate tools (Grep, Glob, Read)
- If you cannot verify something, explicitly ask the user for clarification
- Never guess at implementation details, function signatures, or configurations
- When in doubt, admit uncertainty and propose how to find the correct information

## Git (General)
- **NEVER use `git -C <path>`** — always run `git` directly from the working directory
- **ALWAYS use `git --no-pager`** for diff, log, show

## Git Commits

### Important
- **NEVER commit automatically or proactively** - only commit when the user explicitly asks to commit
- Do NOT commit as part of other tasks unless specifically requested

### Basic Principle
When the user explicitly requests a commit: automatic generation of Git commit messages with Gitmoji emojis based on staged changes.

### Commit Structure
```
[Emoji] [type]([scope]): [Subject - max 50 chars]

[Optional: Body with detailed explanation]

[Optional: Footer with "Closes #issue" or "BREAKING CHANGE: description"]
```

### Structure Rules
- **Emoji**: Exact matching Gitmoji at the beginning, followed by space
- **Type**: feat, fix, refactor, chore, docs etc. matching the emoji
- **Scope**: In parentheses, derived from file paths (e.g. 'auth' for 'src/auth/')
- **Subject**: Imperative, capital first letter, no period at end
- **Body**: Detailed explanation in paragraphs, separated by blank line
- **Footer**: "Closes #issue" or "BREAKING CHANGE: description"

### Commit Splitting Logic
Group changes by:
- **Type**: Different types (feat, fix, docs) -> separate commits
- **Context**: Group by scope or component
- **File paths**: Unrelated directories -> separate commits
- **Relationship**: Feature + tests = one commit

### Execution Protocol
1. Analysis of the Git diff of staged changes
2. Logical grouping of changes
3. For each group:
   - `git add <file(s)>` (if necessary)
   - `git commit -m "<message>"`
4. Confirmation: "Committed: [commit message]"

### Forbidden
- **NEVER add "Co-Authored-By" lines or any other automated signatures to commit messages**

### Special Rules
- **BREAKING CHANGE**: When using breaking change emoji, always add footer
- **Issue Extraction**: Use branch names (e.g. 'feature/123-login' -> "Closes #123")
- **Priority**: feat > fix > refactor > chore
- **No-Pager**: Always use `git --no-pager` for diff, log, show
- **No `-C` flag**: Never use `git -C <path>` when already in the correct working directory — just run `git` directly
- **Fallback**: If no matching emoji -> use general maintenance emoji

### Gitmoji Reference (66 Emojis)
- 🎨 Improve structure / format of the code.
- ⚡️ Improve performance.
- 🔥 Remove code or files.
- 🐛 Fix a bug.
- 🚑️ Critical hotfix.
- ✨ Introduce new features.
- 📝 Add or update documentation.
- 🚀 Deploy stuff.
- 💄 Add or update the UI and style files.
- 🎉 Begin a project.
- ✅ Add, update, or pass tests.
- 🔒️ Fix security or privacy issues.
- 🔐 Add or update secrets.
- 🔖 Release / Version tags.
- 🚨 Fix compiler / linter warnings.
- 🚧 Work in progress.
- 💚 Fix CI Build.
- ⬇️ Downgrade dependencies.
- ⬆️ Upgrade dependencies.
- 📌 Pin dependencies to specific versions.
- 👷 Add or update CI build system.
- 📈 Add or update analytics or track code.
- ♻️ Refactor code.
- ➕ Add a dependency.
- ➖ Remove a dependency.
- 🔧 Add or update configuration files.
- 🔨 Add or update development scripts.
- 🌐 Internationalization and localization.
- ✏️ Fix typos.
- 💩 Write bad code that needs to be improved.
- ⏪️ Revert changes.
- 🔀 Merge branches.
- 📦️ Add or update compiled files or packages.
- 👽️ Update code due to external API changes.
- 🚚 Move or rename resources (e.g.: files, paths, routes).
- 📄 Add or update license.
- 💥 Introduce breaking changes.
- 🍱 Add or update assets.
- ♿️ Improve accessibility.
- 💡 Add or update comments in source code.
- 🍻 Write code drunkenly.
- 💬 Add or update text and literals.
- 🗃️ Perform database related changes.
- 🔊 Add or update logs.
- 🔇 Remove logs.
- 👥 Add or update contributor(s).
- 🚸 Improve user experience / usability.
- 🏗️ Make architectural changes.
- 📱 Work on responsive design.
- 🤖 Mock things.
- 🥚 Add or update an easter egg.
- 🙈 Add or update a .gitignore file.
- 📸 Add or update snapshots.
- ⚗️ Perform experiments.
- 🔍️ Improve SEO.
- 🏷️ Add or update types.
- 🌱 Add or update seed files.
- 🚩 Add, update, or remove feature flags.
- 🥅 Catch errors.
- 💫 Add or update animations and transitions.
- ❌ Deprecate code that needs to be cleaned up.
- 🛂 Work on code related to authorization, roles and permissions.
- 🩹 Simple fix for a non-critical issue.
- 🧐 Data exploration/inspection.
- ⚰️ Remove dead code.
- 🧪 Add a failing test.
- 👔 Add or update business logic.
- 🩺 Add or update healthcheck.
- 🧱 Infrastructure related changes.
- 🧑‍💻 Improve developer experience.
- 💸 Add sponsorships or money related infrastructure.
- 🧵 Add or update code related to multithreading or concurrency.
- 🦺 Add or update code related to validation.
- 📴 Improve offline support.
