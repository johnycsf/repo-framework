# Native menus (`ui_choose`)

`./manage.sh` uses a **bash** select loop: ↑/↓ (or j/k) to move, **Enter** to confirm.
The current item is marked with a green `>` chevron — no gum/whiptail required.

Non-interactive / non-TTY callers get the first option automatically.

Helper in `deps.sh`: `ui_choose VAR "Header" "Option A" "Option B" ...`
