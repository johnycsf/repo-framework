# Arrow-key menus (`ui_choose`)

`./manage.sh` uses **arrow keys + Enter** via [gum](https://github.com/charmbracelet/gum).

Priority:
1. `gum choose` (auto-installed via package or `~/.local/bin` binary)
2. `whiptail` (newt)
3. Numbered list fallback (non-TTY / no tools)

Helpers in `deps.sh`: `_ui_ensure_chooser`, `ui_choose`.
