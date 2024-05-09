#!/bin/sh

[[ "$1" = "exec" ]] && exec=true || exec=false
echo "execution is $exec"

function notify_success_or_failure () {
    [[ $1 -eq 0 ]] && echo "... success" || echo "... failure"
}

function create_symlink () {
    if [[ `readlink $2` = $1 ]]; then
        echo "[already linked correctly] $2 -> $1"
        return
    fi
    echo "[link] $2 -> $1"
    if $exec; then
        mkdir -pv `dirname $2`
        ln -snfi $1 $2
        notify_success_or_failure $?
    fi
}

function install_ranger_configuration () {
    src=/usr/share/doc/ranger/examples/rc_emacs.conf
    dest=~/.config/ranger/rc.conf
    if [[ -e $dest ]]; then
        echo "[already installed] $dest"
        return
    fi
    echo "[install] $src -> $dest"
    if $exec; then
        mkdir -pv `dirname $dest`
        cp $src $dest
        sed -i "s/set mouse_enabled true/set mouse_enabled false/" $dest
        notify_success_or_failure $?
    fi
}

srcdir=$(cd $(dirname $0); pwd)/files
create_symlink $srcdir/emacs.d/init.el ~/.emacs.d/init.el
create_symlink $srcdir/gitconfig ~/.gitconfig
create_symlink $srcdir/stumpwm.d/init.lisp ~/.stumpwm.d/init.lisp
create_symlink $srcdir/xinitrc ~/.xinitrc
create_symlink $srcdir/Xresources ~/.Xresources
create_symlink $srcdir/zshrc ~/.zshrc
install_ranger_configuration
