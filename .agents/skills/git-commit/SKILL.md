---
name: git-commit
description: Creates git commits following project conventions — one logical change per commit, concise messages, safety rules. Use when the user asks to commit, create a git commit, split changes into commits, or write a commit message.
---

# Git Commit

## Коммиты

Каждое крупное изменение — отдельный коммит. Не склеивать unrelated правки в один коммит. Сообщение коммита кратко описывает суть изменения.

## When to Commit

**Only commit when the user explicitly asks.** If unclear, ask first. Never commit proactively after finishing work.

## Before Committing

Run in parallel:

```bash
git status
git diff
git log --oneline -10
```

Use recent commit messages as style reference. Match their language and tone (this repo uses short English imperatives, e.g. `Add spidertron mk3 recipe`).

## Splitting Changes

One commit = one logical unit of work. If `git diff` mixes unrelated changes, split before committing:

| Change type | Separate commit? |
|-------------|------------------|
| New spidertron variant (`prototypes/<name>/`) | Yes — one commit per variant |
| Locale strings for one feature | With that feature |
| `info.json` version bump + `changelog.txt` | Together, after feature commits |
| Bug fix unrelated to current feature | Separate commit |
| Refactor + behavior change | Separate commits |

**Workflow to split:**

1. Stage and commit the first logical chunk: `git add <paths>` → commit
2. Repeat until working tree is clean
3. Never create an empty commit

## Commit Message

- One line, imperative mood, no period at end
- Describes **why/what**, not file list
- Good: `Fix fuel categories for Krastorio2 compatibility`
- Bad: `update files`, `fix`, `changes to data.lua and fuel.lua`

## Commit Workflow

When the user asks to commit:

1. Analyze staged and unstaged changes
2. Split into separate commits if needed (see above)
3. Stage relevant files — never stage secrets (`.env`, credentials)
4. Commit with HEREDOC message:

```bash
git add <paths>
git commit -m "$(cat <<'EOF'
Brief description of the change.

EOF
)"
```

5. Run `git status` to verify success

## Safety Rules

- **Never** update git config
- **Never** run destructive commands (`push --force`, `reset --hard`) unless explicitly requested
- **Never** skip hooks (`--no-verify`, `--no-gpg-sign`) unless explicitly requested
- **Never** force-push to `main`/`master` — warn the user
- **Never** amend unless: user requested it, HEAD commit is yours and unpushed, and hook auto-modified files
- If commit **failed** due to hook → fix and create a **new** commit, do not amend
- **Never** push unless the user explicitly asks

## Examples

**Single feature:**
```
Add assault spidertron mk2 prototypes
```

**Bug fix:**
```
Fix equipment grid sync in data-final-fixes
```

**Version bump (after feature commits):**
```
Bump version to 26.3.4
```

**Multiple commits from one session:**

```
1. Add spidertron mk4 entity and item prototypes
2. Add spidertron mk4 recipe and technology
3. Add spidertron mk4 locale strings
4. Bump version to 26.4.0
```
