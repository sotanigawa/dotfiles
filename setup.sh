#!/bin/bash

set -euo pipefail

dry_run=true
[[ "${1:-}" = "exec" ]] && dry_run=false
echo "dry-run: $dry_run"

run() {
    if $dry_run; then
        echo "[dry-run] $*"
    else
        "$@"
    fi
}

create_symlink() {
    local src="$1" dst="$2"
    if [[ "$(readlink "$dst" 2>/dev/null)" = "$src" ]]; then
        echo "[already linked] $dst -> $src"
        return
    fi
    echo "[link] $dst -> $src"
    run mkdir -pv "$(dirname "$dst")"
    run ln -snf "$src" "$dst"
}

files="$(cd "$(dirname "$0")"; pwd)/files"

create_symlink "$files/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
create_symlink "$files/alacritty/dracula.toml"   "$HOME/.config/alacritty/dracula.toml"
create_symlink "$files/emacs/init.el"            "$HOME/.config/emacs/init.el"
create_symlink "$files/git/config"               "$HOME/.config/git/config"
create_symlink "$files/nvim/init.lua"            "$HOME/.config/nvim/init.lua"
create_symlink "$files/ranger/rc.conf"           "$HOME/.config/ranger/rc.conf"
create_symlink "$files/ranger/rifle.conf"        "$HOME/.config/ranger/rifle.conf"
create_symlink "$files/stumpwm/config"           "$HOME/.config/stumpwm/config"
create_symlink "$files/X11/xinitrc"              "$HOME/.config/X11/xinitrc"
create_symlink "$files/X11/Xresources"           "$HOME/.config/X11/Xresources"
create_symlink "$files/zsh/zshenv"               "$HOME/.zshenv"
create_symlink "$files/zsh/zshrc"                "$HOME/.config/zsh/.zshrc"
