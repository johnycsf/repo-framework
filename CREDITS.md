# Credits

This repository packages, configures, or documents upstream software. **Credit for those applications belongs to their upstream developers.**

Replace the upstream section with the real projects this repo builds on.

## Upstream projects

- **Project name** — maintainers / org — [upstream repo or site](https://example.com/)
- **Related image or library** — [link](https://example.com/)

## Shared johnycsf tooling

These install/manage/backup helpers are used across johnycsf stacks. Credit the upstream projects:

| Tool | Role in this repo | Upstream |
|------|-------------------|----------|
| **age** | Optional encrypted offsite backup exports (`./backup.sh --encrypt`) | [FiloSottile/age](https://github.com/FiloSottile/age) |
| **rsync** | Incremental hardlink snapshot backups | [rsync.samba.org](https://rsync.samba.org/) / your OS package |
| **Docker** / **Docker Compose** | Container runtime for app stacks | [docker.com](https://www.docker.com/) |
| **Catppuccin** | Color inspiration for the pastel terminal UI | [catppuccin/catppuccin](https://github.com/catppuccin/catppuccin) |

When you add a new helper tool or feature dependency, **add it here** (and in `repo-framework`’s template) in the same PR.

## Notes

- All trademarks and project names belong to their respective owners.
- This repo is **not affiliated with or endorsed by** the upstream projects unless stated otherwise.
- **Keep this file accurate** whenever you add or remove app dependencies **or** shared tooling (age, rsync, etc.).
