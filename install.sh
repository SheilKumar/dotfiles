#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

link() {
  local src="$DOTFILES/$1"
  local dst="$CONFIG/$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "Backing up existing $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "Linked $dst → $src"
}

mkdir -p "$CONFIG"
link nvim nvim
link tmux tmux

TPM="$CONFIG/tmux/plugins/tpm"
if [ ! -d "$TPM" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM"
fi

echo ""
echo "Done. Open tmux and press prefix + I to install tmux plugins."
echo "Open nvim — lazy.nvim will auto-install plugins on first launch."
