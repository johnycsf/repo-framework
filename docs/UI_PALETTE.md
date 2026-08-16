# Install script UI palette (standard)

All interactive `deps.sh` UIs in johnycsf app repos use a **soft pastel** palette inspired by [Catppuccin Mocha](https://github.com/catppuccin/catppuccin).

| Role | Variable | Truecolor (R,G,B) | Feel |
|------|----------|-------------------|------|
| Errors | `UI_RED` | 243,139,168 | soft rose |
| Success | `UI_GREEN` | 166,227,161 | soft green |
| Warnings | `UI_YELLOW` | 249,226,175 | soft yellow |
| Steps | `UI_BLUE` | 137,180,250 | soft blue |
| Accents | `UI_MAGENTA` | 203,166,247 | soft mauve |
| Banner / info | `UI_CYAN` | 137,220,235 | soft sky |
| Body emphasis | `UI_WHITE` | 205,214,244 | soft text |
| Extra | `UI_PEACH` / `UI_TEAL` / `UI_PINK` | peach / teal / pink | optional accents |

- Truecolor when `COLORTERM` is `truecolor`/`24bit` (or `TERM=*-direct`)
- Otherwise 256-color pastel approximations
- Honors `NO_COLOR=1` and non-TTY (no color)

Source of the `_ui_setup` block: copy from any current app `deps.sh`, or from this framework’s `snippets/ui-pastel.sh`.
