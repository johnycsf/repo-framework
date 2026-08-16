# New repo checklist (after using repo-framework)

Do these once for every new **johnycsf** code repository.

## 1. Replace the framework README (if needed)

If you created the repo with **Use this template** / `gh repo create --template`, your `README.md` still describes the framework.

```bash
cp templates/APP_README.md README.md
# edit README.md — set title, description, install steps
rm -rf docs/NEW_REPO_CHECKLIST.md templates scripts
# optional: keep docs/ if you want the checklist in the new repo temporarily
```

The bootstrap script (`scripts/new-from-framework.sh`) does this swap for you.

## 2. Fill CREDITS.md

List the real upstream projects and maintainers (Immich, Vaultwarden, Nextcloud, …). Remove the placeholder bullets.

## 3. Customize README.md

- Title and one-line description
- Install / update / backup sections for this project
- Keep **Credits**, **Disclaimer**, **Bug reports & contributions**, and **Support this work**

## 4. Keep these files as-is (unless policy changes)

- `DISCLAIMER.md`
- `CONTRIBUTING.md`
- `LICENSE`
- `.github/FUNDING.yml`
- `.github/ISSUE_TEMPLATE/bug_report.yml`

## 5. Add project code

Compose files, manifests, `install.sh` / `manage.sh`, etc. Prefer official upstream images only.

## 6. Push and verify

```bash
git add -A
git commit -m "Initialize from repo-framework"
git push -u origin main
```

Check on GitHub:

- [ ] README shows Credits / Disclaimer / bug report links
- [ ] **Sponsor** button appears (FUNDING.yml)
- [ ] **New issue** offers the Bug report form
- [ ] CREDITS.md names upstream developers

## 7. Interactive install UI (if you add deps.sh)

Copy the pastel `_ui_setup` from [`snippets/ui-pastel.sh`](../snippets/ui-pastel.sh) (see [UI_PALETTE.md](UI_PALETTE.md)).
