#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="ssh-matrix-idle.sh"
TARGET="$INSTALL_DIR/$SCRIPT_NAME"

mkdir -p "$INSTALL_DIR"

cp "./$SCRIPT_NAME" "$TARGET"
chmod +x "$TARGET"

# avoid duplicate injection
if ! grep -qF "# >>> ssh-matrix-idle >>>" "$HOME/.bashrc"; then
cat <<'EOF' >> "$HOME/.bashrc"

# >>> ssh-matrix-idle >>>
if [[ -n "$SSH_CONNECTION" && -n "$SSH_TTY" ]]; then
    ~/.local/bin/ssh-matrix-idle.sh >/dev/null 2>&1 &
fi
# <<< ssh-matrix-idle <<<
EOF
fi

echo "Installed ssh-matrix-idle successfully."
echo "Restart SSH session to activate."