#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="ssh-matrix-idle.sh"
TARGET="$INSTALL_DIR/$SCRIPT_NAME"

mkdir -p "$INSTALL_DIR"

cp "./$SCRIPT_NAME" "$TARGET"
chmod +x "$TARGET"

# avoid duplicate injection
if ! grep -q "ssh-matrix-idle.sh" "$HOME/.bashrc"; then
cat <<'EOF' >> "$HOME/.bashrc"

# >>> ssh-matrix-idle >>>
if [[ -n "$SSH_TTY" ]]; then
    pgrep -f ssh-matrix-idle.sh >/dev/null || ~/.local/bin/ssh-matrix-idle.sh "$SSH_TTY" >/dev/null 2>&1 &
fi
# <<< ssh-matrix-idle <<<
EOF
fi

echo "Installed ssh-matrix-idle successfully."
echo "Restart SSH session to activate."