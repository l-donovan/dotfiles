#!/usr/bin/env bash

if [[ ! -x $(which nvim) ]]; then
    >&2 echo These dotfiles depend on \e[3mnvim\3[23m!
    exit 1
fi

if [[ ! -x $(which zsh) ]]; then
    >&2 echo -e "These dotfiles depend on \e[3mzsh\e[23m!"
    exit 1
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    >&2 echo -e "These dotfiles depend on \e[3moh-my-zsh\e[23m!"
    exit 1
fi

mkdir -p ~/.config/nvim/lua
ln .config/nvim/init.vim ~/.config/nvim/init.vim
ln .config/nvim/lua/init.lua ~/.config/nvim/lua/init.lua
ln .zshrc ~/.zshrc

mkdir -p ~/.config/kitty
ln .config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln .config/kitty/gruvbox_light.conf ~/.config/kitty/gruvbox_light.conf
