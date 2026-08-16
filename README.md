# repo-framework

Standard starting point for **johnycsf** public GitHub repositories.

Use this so every new repo ships with the same:

- As-is **disclaimer** (you are not liable)
- **Contributing** + GitHub-only bug reports
- **Credits** for upstream developers
- GitHub Sponsors **funding**
- MIT **license**
- Issue template for bugs
- Soft **pastel** terminal UI palette for interactive install scripts (`docs/UI_PALETTE.md`)

## Create a new repo from this framework

### Option A — GitHub UI (easiest)

1. Open https://github.com/johnycsf/repo-framework
2. Click **Use this template** → **Create a new repository**
3. Name it, create it, clone it
4. Follow [docs/NEW_REPO_CHECKLIST.md](docs/NEW_REPO_CHECKLIST.md)

### Option B — GitHub CLI

```bash
gh repo create johnycsf/YOUR-REPO-NAME \
  --template johnycsf/repo-framework \
  --public \
  --clone \
  --description "Short description here"
cd YOUR-REPO-NAME
# then follow docs/NEW_REPO_CHECKLIST.md
```

### Option C — Local bootstrap script

From a clone of this framework:

```bash
./scripts/new-from-framework.sh YOUR-REPO-NAME "Short description here"
```

That creates the GitHub repo from this template, clones it beside the framework, and prints the checklist.

## What gets copied into every new repo

| Path | Purpose |
|------|---------|
| `DISCLAIMER.md` | No warranty / not responsible |
| `CONTRIBUTING.md` | Bugs & PRs via GitHub only |
| `CREDITS.md` | Fill in upstream developers |
| `LICENSE` | MIT (johnycsf) |
| `README.md` | Starter README with required sections |
| `.github/FUNDING.yml` | GitHub Sponsors → johnycsf |
| `.github/ISSUE_TEMPLATE/bug_report.yml` | Guided bug reports |
| `.gitignore` | Sensible defaults |
| `snippets/ui-pastel.sh` | Pastel `_ui_setup` for install/manage UIs |
| `SECURITY.md` / `CHANGELOG.md` | Vulnerability reporting + release notes
| `snippets/backup-encrypt.sh` | Optional age-encrypted backup exports
| `docs/BACKUP_ENCRYPTION.md` | Encryption design (age vs SHA256 integrity)
| `docs/HOST_PORTS.md` | Docker host port prompts + conflict checks

| `docs/UI_PALETTE.md` | Palette reference |

## After you create a repo

See **[docs/NEW_REPO_CHECKLIST.md](docs/NEW_REPO_CHECKLIST.md)** — customize `README.md`, fill `CREDITS.md`, delete framework-only docs if you want.

## Maintaining this framework

When you change shared policy (disclaimer wording, issue template, etc.):

1. Edit files here and push to `main`
2. Optionally re-sync important files into existing app repos with the session scripts (`apply-disclaimer.py` / `apply-credits.py`)

Existing app stacks (Immich, Vaultwarden, …) already follow this framework’s docs; new ones should start from this template.
