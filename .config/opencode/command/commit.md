---
description: Create Gitmoji-style commits from the current changes
---

Create one or more commits from the user's current changes. Invoking `/commit` is an
explicit request to commit, so this command may stage files on its own.

## Steps

1. Inspect state with `git --no-pager status`, `git --no-pager diff --staged`, and
   `git --no-pager diff`.
   - Run `git` from the working directory; never use `git -C <path>`.
   - Decide what to commit:
     - If changes are already staged, commit only those. Leave unstaged and untracked
       files untouched, since the user curated the staging area deliberately.
     - If nothing is staged, treat all changes (modified, deleted, and untracked) as the
       set to commit and stage them as needed while grouping (`git add <paths>`).
   - If the working tree is completely clean, stop and tell the user there is nothing to
     commit.
2. Group the changes into logical commits:
   - Split by type (`feat` / `fix` / `docs` / ...), by scope or component, and by
     unrelated paths.
   - Keep a feature and its tests in the same commit.
   - Grouping priority when a change spans types: `feat > fix > refactor > chore`.
3. For each group, write a message in this format:

   ```
   <emoji> <type>(<scope>): <subject>

   <optional body>

   <optional footer>
   ```

   - **Emoji:** the single best-matching Gitmoji from `~/.config/opencode/gitmoji.md`.
     If none fits, use `🔧`.
   - **Type:** `feat`, `fix`, `refactor`, `chore`, `docs`, etc., consistent with the emoji.
   - **Scope:** derived from the path (e.g. `auth` for `src/auth/`).
   - **Subject:** imperative, capitalized, no trailing period, max 50 characters.
   - **Body:** explanation in paragraphs, separated by a blank line. Optional.
   - **Footer:** `Closes #<issue>` or `BREAKING CHANGE: <description>`.
4. Derive the issue number from the branch name where possible
   (e.g. `feature/123-login` → `Closes #123`).
5. When a breaking-change emoji (💥) is used, always add a `BREAKING CHANGE:` footer.
6. For each group, stage exactly its files with `git add <paths>` (when not already
   staged), then commit. Never add `Co-Authored-By` lines or any other automated signature.

## Notes

- All commit content is in English.
- Use `git --no-pager` for `diff`, `log`, and `show`.
