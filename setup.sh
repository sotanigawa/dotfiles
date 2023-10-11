#!/bin/sh

[[ "$1" = "exec" ]] && exec=true || exec=false
echo "execution is $exec"

function create_dotfiles_symlinks () {
    srcdir=$(cd $(dirname $0); pwd)
    files=(
        .emacs.d/init.el
        .gitconfig
        .zshrc
    )
    for file in ${files[@]};
    do
        src=$srcdir/$file
        dest=~/$file
        if [[ `readlink $dest` = $src ]]; then
            echo "[already linked correctly] $dest -> $src"
            continue
        fi
        if $exec; then
            mkdir -pv `dirname $dest`
            ln -snfi $src $dest
        fi
        echo "[link] $dest -> $src"
    done
}

function install_ranger_configuration () {
    src=/usr/share/doc/ranger/examples/rc_emacs.conf
    dest=~/.config/ranger/rc.conf
    if [[ -e $dest ]]; then
        echo "[already installed] $dest"
        return
    fi
    if $exec; then
        mkdir -pv `dirname $dest`
        cp $src $dest
    fi
    echo "[install] $src -> $dest"
}

create_dotfiles_symlinks
install_ranger_configuration
