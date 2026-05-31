---
name: git-release
description: Prepares a Factorio mod release — bumps version in info.json and changelog.txt, commits, creates a git tag. Use when the user asks to release, publish a version, bump version, create a git tag, or cut a new release.
---

# Git Release

## Версия

Сейчас v26.3.3 для Factorio 2.0. Версия в `info.json` и `changelog.txt`.

Read current version from `info.json` → `"version"`. Do not guess — always read the file.

## When to Release

**Only when the user explicitly asks.** Confirm the target version and changelog text if not provided.

For commits during release, follow [git-commit](../git-commit/SKILL.md) (one logical commit for version bump, safety rules).

## Version Bump Rules

| Change scope | Bump | Example |
|--------------|------|---------|
| Bug fix, compatibility tweak | Patch | 26.3.3 → 26.3.4 |
| New feature, new spidertron | Minor | 26.3.3 → 26.4.0 |
| Breaking change (rare) | Major | 26.3.3 → 27.0.0 |

If unsure which bump, ask the user.

## Release Checklist

```
- [ ] Working tree clean (or only release files will be staged)
- [ ] Feature commits already done separately
- [ ] New version decided
- [ ] Changelog entry written
- [ ] info.json version updated
- [ ] changelog.txt entry prepended
- [ ] Release commit created
- [ ] Annotated git tag created
- [ ] Push (only if user asked)
```

## Step 1: Gather Release Notes

If the user did not provide changelog text, derive from commits since last release:

```bash
git tag -l --sort=-v:refname
git log <last-tag>..HEAD --oneline
```

If no tags exist, use commits since the last version bump commit or ask the user.

## Step 2: Update Files

### info.json

Set `"version"` to the new version (no `v` prefix):

```json
"version": "26.3.4"
```

### changelog.txt

Prepend a new block at the **top** of the file. Match existing format exactly:

```
---------------------------------------------------------------------------------------------------
Version: 26.3.4
Date: 2026-05-31
  Changes:
    - Description of change
  Bugfixes:
    - Fixed something
  Compatibility:
    - Mod X compatibility
  Features:
    - New spidertron variant
```

Rules:
- Separator line: 99 dashes (`---------------------------------------------------------------------------------------------------`)
- Date format: `YYYY-MM-DD` (today's date unless user specifies otherwise)
- Categories: `Changes`, `Bugfixes`, `Compatibility`, `Features` — use only what applies
- Each item indented with 4 spaces and `- ` bullet
- Blank line after category header before first item

## Step 3: Commit Release

Stage only release files:

```bash
git add info.json changelog.txt
git commit -m "$(cat <<'EOF'
Release v26.3.4
EOF
)"
```

Alternative message (also acceptable): `Bump version to 26.3.4`

Verify:

```bash
git status
git show --stat HEAD
```

## Step 4: Create Git Tag

Use annotated tag with `v` prefix:

```bash
git tag -a v26.3.4 -m "Release v26.3.4"
```

Verify:

```bash
git tag -l --sort=-v:refname | head -5
git show v26.3.4
```

**Never** force-update an existing tag (`git tag -f`) unless the user explicitly requests it and understands the impact.

## Step 5: Push (Optional)

**Only push when the user explicitly asks.**

```bash
git push origin main
git push origin v26.3.4
```

Or push all tags: `git push origin --tags`

If no remote is configured, tell the user and skip push.

## Safety Rules

Same as git-commit, plus:

- **Never** release with uncommitted unrelated changes in the same commit
- **Never** bump version without updating both `info.json` and `changelog.txt`
- **Never** push or force-push tags unless explicitly requested
- If tag already exists → stop and ask how to proceed

## Example Session

User: «Сделай релиз 26.3.4, fix fuel categories for K2»

1. Read `info.json` → current `26.3.3`
2. Update version to `26.3.4`
3. Prepend changelog block with Compatibility entry
4. Commit: `Release v26.3.4`
5. Tag: `v26.3.4`
6. Report: version, tag name, commit hash — ask if push is needed
