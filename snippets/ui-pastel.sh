# Soft pastel terminal UI palette (Catppuccin Mocha–inspired).
# Source this after defining nothing else, or paste into deps.sh as _ui_setup.
# shellcheck shell=bash

_ui_setup() {
  if [[ -t 1 && "${NO_COLOR:-}" != "1" ]]; then
    UI_RESET=$'\033[0m'
    UI_BOLD=$'\033[1m'
    UI_DIM=$'\033[2m'
    # Soft pastel palette — standard for johnycsf interactive install / manage UIs
    if [[ "${COLORTERM:-}" == *truecolor* || "${COLORTERM:-}" == *24bit* || "${TERM:-}" == *-direct ]]; then
      UI_RED=$'\033[38;2;243;139;168m'     # rose
      UI_GREEN=$'\033[38;2;166;227;161m'   # green
      UI_YELLOW=$'\033[38;2;249;226;175m'  # yellow
      UI_BLUE=$'\033[38;2;137;180;250m'    # blue
      UI_MAGENTA=$'\033[38;2;203;166;247m' # mauve
      UI_CYAN=$'\033[38;2;137;220;235m'    # sky
      UI_WHITE=$'\033[38;2;205;214;244m'   # text
      UI_PEACH=$'\033[38;2;250;179;135m'
      UI_TEAL=$'\033[38;2;148;226;213m'
      UI_PINK=$'\033[38;2;245;194;231m'
    else
      # 256-color pastel approximations
      UI_RED=$'\033[38;5;211m'
      UI_GREEN=$'\033[38;5;151m'
      UI_YELLOW=$'\033[38;5;223m'
      UI_BLUE=$'\033[38;5;117m'
      UI_MAGENTA=$'\033[38;5;183m'
      UI_CYAN=$'\033[38;5;116m'
      UI_WHITE=$'\033[38;5;189m'
      UI_PEACH=$'\033[38;5;216m'
      UI_TEAL=$'\033[38;5;152m'
      UI_PINK=$'\033[38;5;218m'
    fi
  else
    UI_RESET= UI_BOLD= UI_DIM=
    UI_RED= UI_GREEN= UI_YELLOW= UI_BLUE= UI_MAGENTA= UI_CYAN= UI_WHITE=
    UI_PEACH= UI_TEAL= UI_PINK=
  fi
  UI_STEP_N=0
  UI_STEP_TOTAL=0
}
