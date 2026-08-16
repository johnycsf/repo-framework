# {{REPO_NAME}}

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-ea4aaa?logo=githubsponsors&logoColor=white)](https://github.com/sponsors/johnycsf)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Issues](https://img.shields.io/badge/issues-welcome-lightgrey.svg)](../../issues/new/choose)

**{{SHORT_DESCRIPTION}}**

> **Choose your path:** document Docker vs Kubernetes sibling links here when applicable.

## Who this is for

**Good fit:** …  
**Not for:** …

## Why this repo

- Beginner-friendly install path (`./install.sh` / `./manage.sh` when present)
- Official upstream images / tools only (when packaging apps)
- Safe update + backup patterns where applicable
- Docker host port conflict checks with optional custom ports (saved in `.env`)

## Support this work

If this stack saved you setup time, please consider sponsoring — it funds:

- Keeping install/update/backup scripts working across common Linux distros
- Testing safe upgrades against **official** upstream images
- Building more beginner-friendly stacks that share the same `./manage.sh` UX

[![Sponsor johnycsf](https://img.shields.io/badge/GitHub%20Sponsors-Donate-ea4aaa?logo=githubsponsors&logoColor=white)](https://github.com/sponsors/johnycsf)

👉 **[github.com/sponsors/johnycsf](https://github.com/sponsors/johnycsf)**

## What you need

- Linux (or macOS) host, or a Kubernetes cluster for k8s variants
- `sudo` if install scripts install host dependencies

## Install

```bash
git clone https://github.com/johnycsf/{{REPO_NAME}}.git
cd {{REPO_NAME}}
# chmod +x manage.sh install.sh   # if present
# ./manage.sh                     # or ./install.sh
```

Liked the install? Star the repo or [sponsor johnycsf](https://github.com/sponsors/johnycsf) so more stacks stay maintained.

## Credits

This repo packages or configures upstream software. See [CREDITS.md](CREDITS.md) for the main developers and projects this work builds on.

## Disclaimer

This project is provided **as is**. The author is **not responsible** for any loss, damage, data corruption, downtime, security issues, or other consequences from using it. Full text: [DISCLAIMER.md](DISCLAIMER.md).

## Bug reports & contributions

If you hit an error, please [open a GitHub Issue](../../issues/new/choose) and follow [CONTRIBUTING.md](CONTRIBUTING.md). Fixes via Pull Request are welcome. GitHub Issues/PRs are the supported way to report problems—there is no private support channel.

## Security

See [SECURITY.md](SECURITY.md) for how to report vulnerabilities.
