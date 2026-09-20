#!/usr/bin/env bash
# Installs the `tinytask` command to ~/.local/bin and its one dependency.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.local/bin"

if ! python3 -c "import pynput" 2>/dev/null; then
  echo "Installing python3-pynput (needs your password)..."
  sudo apt update
  sudo apt install -y python3-pynput python3-xlib
fi

mkdir -p "$DEST"
install -m 755 "$HERE/tinytask" "$DEST/tinytask"
echo "Installed to $DEST/tinytask"

case ":$PATH:" in
  *":$DEST:"*)
    echo "Run it with:  tinytask"
    ;;
  *)
    echo "$DEST is not on your PATH yet. Add it with:"
    echo '  echo '"'"'export PATH="$HOME/.local/bin:$PATH"'"'"' >> ~/.bashrc && source ~/.bashrc'
    ;;
esac

if [ "${XDG_SESSION_TYPE:-x11}" = "wayland" ]; then
  echo
  echo "NOTE: you are on Wayland. tinytask needs X11 - log out and pick an"
  echo "      Xorg session at the login screen."
fi
