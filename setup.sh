#!/bin/sh

DOT_FILES=(
    .emacs.d/init.el
    .gitconfig
    .zshrc
)

for file in ${DOT_FILES[@]}
do
    src=$(cd $(dirname $0); pwd)/$file
    dest=~/$file
    if [ "`readlink $dest`" = $src ]; then
        echo -n '[ok] '
    else
        if [ ! "$1" = 'test' ]; then
            mkdir -pv `dirname $dest`
            ln -snfi $src $dest
        fi
        echo -n '[ln] '
    fi
    echo "$dest -> $src"
done
