#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"

link() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up $dest -> $dest.bak"
    mv -f "$dest" "$dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$DOTFILES/vimrc"     "$HOME/.vimrc"
link "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES/gitconfig" "$HOME/.gitconfig"

