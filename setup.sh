#!/bin/bash

# zsh plugins
mkdir -p ~/.zsh-plugins
git clone https://github.com/romkatv/powerlevel10k ~/.zsh-plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ~/.zsh-plugins/z
git clone https://github.com/jeffreytse/zsh-vi-mode ~/.zsh-plugins/zsh-vi-mode

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
