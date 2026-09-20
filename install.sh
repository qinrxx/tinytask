#!/usr/bin/env bash
# Installs the `task` command to ~/.local/bin
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)/task"
DEST="$HOME/.local/bin"
mkdir -p "$DEST"
install -m 755 "$SRC" "$DEST/task"
echo "Installed to $DEST/task"
case ":$PATH:" in
  *":$DEST:"*) echo "Run it with:  task" ;;
  *) echo "$DEST is not on your PATH. Add it with:"
     echo '  echo '"'"'export PATH="$HOME/.local/bin:$PATH"'"'"' >> ~/.bashrc && source ~/.bashrc' ;;
esac
