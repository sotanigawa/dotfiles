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

## License

These are my personal dotfiles, tailored to my own environment and
not intended for general use. They may change at any time without notice.

That said, feel free to use anything you find useful under the
[MIT License](LICENSE).

`files/alacritty/dracula.toml` is from [Dracula Theme](https://draculatheme.com/)
and is licensed under the MIT License © Dracula Theme.
