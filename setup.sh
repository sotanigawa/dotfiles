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
        echo "[new link] $dest -> $src"
    done
}

function download_ranger_configuration () {
    src=https://raw.githubusercontent.com/ranger/ranger/master/examples/rc_emacs.conf
    dest=~/.config/ranger/rc.conf
    if [[ -e $dest ]]; then
        echo "[already exists] $dest"
        return
    fi
    if $exec; then
        mkdir -pv `dirname $dest`
        curl $src -o $dest
    fi
    echo "[download] $src -> $dest"
}

create_dotfiles_symlinks
download_ranger_configuration
