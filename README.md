# dotfiles

My minimal configuration for Arch Linux.

- **WM**: StumpWM (started via `startx`)
- **Terminal**: Alacritty
- **Shell**: Zsh
- **Editor**: Neovim / Emacs
- **Others**: Tmux, Ranger, Git

All configs follow the XDG Base Directory layout.

## Setup

```sh
git clone https://github.com/sotanigawa/dotfiles ~/dotfiles
cd ~/dotfiles
./setup.sh        # dry-run
./setup.sh exec   # create symlinks
```

Existing files at the destination are overwritten.

## Credits

- [Dracula Theme](https://draculatheme.com/) — MIT License © Dracula Theme
