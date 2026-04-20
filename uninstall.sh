#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT="$INSTALL_DIR/ssh-matrix-idle.sh"

rm -f "$SCRIPT"

# remove bashrc block
sed -i '/# >>> ssh-matrix-idle >>>/,/# <<< ssh-matrix-idle <<</d' "$HOME/.bashrc"
# kill running instances
pkill -f ssh-matrix-idle.sh || true

echo "Uninstalled ssh-matrix-idle."