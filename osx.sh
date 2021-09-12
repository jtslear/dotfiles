#!/bin/bash

function setup_osx {
  if [[ ! $(type brew) ]]; then
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if [[ "$SHELL" != $(which zsh) ]]; then
    echo "changing ${SHELL}"
    chsh -s $(which zsh)
  fi

  brew tap thoughtbot/formulae && brew install rcm

  MY_DOTFILES=$HOME/projects/dotfiles
  TB_DOTFILES=$HOME/projects/dotfiles-thoughtbot

  if [ ! -e $TB_DOTFILES ]; then
    git clone https://github.com/thoughtbot/dotfiles.git $TB_DOTFILES
  fi

  pushd $TB_DOTFILES
  git pull
  popd

  pushd $MY_DOTFILES
  git pull
  popd

  rcup -d $TB_DOTFILES -x gitconfig -x README.md -x LICENSE -x Brewfile -x rcrc
  rcup -f -d $MY_DOTFILES -x README.md -x Brewfile -x install -x laptop.local

  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim

  brew update
  brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
  brew install \
    ag \
    ansible \
    bash-completion \
    gnupg \
    golang \
    gpg \
    gpg-agent \
    heroku \
    hub \
    kubectl \
    jq \
    nmap \
    nvm \
    pinentry-mac \
    sl \
    socat \
    terraform \
    tmux \
    tree \
    watch

  brew upgrade

  unlink ~/.zsh/configs/keybindings.zsh
}
