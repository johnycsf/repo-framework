#!/usr/bin/env bash
# Create a new johnycsf GitHub repo from johnycsf/repo-framework and prepare the working tree.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./scripts/new-from-framework.sh <repo-name> [description] [--private]

Examples:
  ./scripts/new-from-framework.sh my-cool-stack "Homelab stack for X"
  ./scripts/new-from-framework.sh experiment-foo "Scratch pad" --private

Requires: gh (authenticated as johnycsf), git
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || $# -lt 1 ]]; then
  usage
  exit 0
fi

REPO_NAME="$1"
shift
DESCRIPTION="Homelab / open-source project"
VISIBILITY=(--public)

while [[ $# -gt 0 ]]; do
  case "$1" in
    --private) VISIBILITY=(--private); shift ;;
    --public) VISIBILITY=(--public); shift ;;
    *) DESCRIPTION="$1"; shift ;;
  esac
done

OWNER="${GITHUB_OWNER:-johnycsf}"
TEMPLATE="${TEMPLATE_REPO:-johnycsf/repo-framework}"
PARENT="$(cd "$(dirname "$0")/../.." && pwd)"
# Prefer creating next to other clones (session repos/) when run from session clone;
# otherwise create beside current directory.
if [[ "$(basename "$PARENT")" == "repos" ]]; then
  DEST_PARENT="$PARENT"
else
  DEST_PARENT="$(pwd)"
fi
DEST="$DEST_PARENT/$REPO_NAME"

if [[ ! "$REPO_NAME" =~ ^[A-Za-z0-9._-]+$ ]]; then
  echo "error: invalid repo name: $REPO_NAME" >&2
  exit 1
fi

if [[ -e "$DEST" ]]; then
  echo "error: destination already exists: $DEST" >&2
  exit 1
fi

if ! command -v gh >/dev/null; then
  echo "error: gh CLI is required" >&2
  exit 1
fi

echo "==> Creating $OWNER/$REPO_NAME from template $TEMPLATE"
gh repo create "$OWNER/$REPO_NAME" \
  --template "$TEMPLATE" \
  "${VISIBILITY[@]}" \
  --description "$DESCRIPTION" \
  --clone=false

echo "==> Cloning into $DEST"
gh repo clone "$OWNER/$REPO_NAME" "$DEST"

echo "==> Applying app starter README and placeholders"
cd "$DEST"
if [[ -f templates/APP_README.md ]]; then
  # shellcheck disable=SC2016
  sed \
    -e "s/{{REPO_NAME}}/${REPO_NAME}/g" \
    -e "s/{{SHORT_DESCRIPTION}}/${DESCRIPTION//\//\\/}/g" \
    templates/APP_README.md > README.md
fi

# Drop framework-only scaffolding from the new project tree
rm -rf templates scripts/new-from-framework.sh
# Keep checklist briefly for the author, then they can delete
if [[ -f docs/NEW_REPO_CHECKLIST.md ]]; then
  mv docs/NEW_REPO_CHECKLIST.md ./NEW_REPO_CHECKLIST.md
  rmdir docs 2>/dev/null || true
fi

git add -A
if ! git diff --cached --quiet; then
  git -c user.name="${GIT_AUTHOR_NAME:-johnycsf}" \
      -c user.email="${GIT_AUTHOR_EMAIL:-johnycsf@gmail.com}" \
      commit -m "Initialize from repo-framework

Replace framework README with app starter; keep disclaimer, contributing, credits, and funding."
  git push -u origin HEAD
fi

cat <<EOF

Done: https://github.com/$OWNER/$REPO_NAME
Local: $DEST

Next:
  1. Edit README.md (install steps, features)
  2. Fill CREDITS.md with upstream developers
  3. Add your project files
  4. Delete NEW_REPO_CHECKLIST.md when finished
  5. See NEW_REPO_CHECKLIST.md for the full list
EOF
