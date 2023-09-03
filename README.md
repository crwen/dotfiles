# dotfiles

Install dependencies

```sh 
# brew install ripgrep fd fzf tldr neovim jq htop ccat git-delta joshuto
./brew_package_install.sh
```


Config zsh

```sh
# to install plugin
./zsh_install.sh
source ~/.zshrc
```


Config [LazyVim](https://www.lazyvim.org/)

```sh
mv lazyvim ~/.config/nvim

nvim
```

Config tmux

```sh
# install tpm plugin manager
brew install tpm


# install plugin
tmux
prefix + I
```

Install [yabai](https://github.com/koekeishiya/yabai)(a window manager, need [disable SIP](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection))

```sh
# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)

brew install koekeishiya/formulae/yabai
# start yabai
yabai --start-service

# stop yabai
yabai --stop-service

# install skhd
brew install koekeishiya/formulae/skhd
skhd --start-service
```


To see pdf info in fzf/joshuto

```
brew install exiftool
```


Find [Nerd Font](https://www.nerdfonts.com/font-downloads) and install
- Hack Nerd Font for lazyvim(just because it supports more icon)
- JetBrainsMono Nerd Font(Alacritty may use)
