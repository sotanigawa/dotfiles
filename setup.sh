#!/bin/sh

[[ "$1" = "exec" ]] && exec=true || exec=false
echo "execution flag is $exec"

function create_symlink () {
    if [[ `readlink $2` = $1 ]]; then
        echo "[already linked correctly] $2 -> $1"
        return
    fi
    echo "[link] $2 -> $1"
    if $exec; then
        mkdir -pv `dirname $2`
        ln -snfi $1 $2
    fi
}

function ranger_rc_conf_setup () {
    rc_conf_default=/usr/share/doc/ranger/examples/rc_emacs.conf
    rc_conf=~/.config/ranger/rc.conf
    if [[ -e $rc_conf ]]; then
        echo "[file already exists] $rc_conf"
        return
    fi
    echo "[copy and tweak] $rc_conf_default -> $rc_conf"
    if $exec; then
        mkdir -pv `dirname $rc_conf`
        cp $rc_conf_default $rc_conf
        sed -i "s/set mouse_enabled true/set mouse_enabled false/" $rc_conf
    fi
}

files=$(cd $(dirname $0); pwd)/files

create_symlink $files/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
create_symlink $files/emacs.d/init.el ~/.emacs.d/init.el
create_symlink $files/gitconfig ~/.gitconfig
create_symlink $files/ranger/rifle.conf ~/.config/ranger/rifle.conf
create_symlink $files/stumpwm.d/init.lisp ~/.stumpwm.d/init.lisp
create_symlink $files/xinitrc ~/.xinitrc
create_symlink $files/Xresources ~/.Xresources
create_symlink $files/zshrc ~/.zshrc

ranger_rc_conf_setup
