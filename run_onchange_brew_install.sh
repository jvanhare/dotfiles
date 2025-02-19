#!/bin/sh

{{ if eq .chezmoi.hostname "heimdall" }}
brew install curl
brew install emacs
brew install git
brew install llvm
brew install lmod
brew install neofetch
brew install ninja
brew install vim
brew install wget
brew install zsh
{{ end }}

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
