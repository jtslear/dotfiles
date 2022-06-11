#!/bin/bash

export _NORM="\\033[0m"
export _BLK="\\033[0;30m"
export _BBLK="\\033[1;30m"
export _RED="\\033[0;31m"
export _BRED="\\033[1;31m"
export _GRN="\\033[0;32m"
export _BGRN="\\033[1;32m"
export _YEL="\\033[0;33m"
export _BYEL="\\033[1;33m"
export _BLU="\\033[0;34m"
export _BBLU="\\033[1;34m"
export _MAG="\\033[0;35m"
export _BMAG="\\033[1;35m"
export _CYN="\\033[0;36m"
export _BCYN="\\033[1;36m"
export _WHT="\\033[0;37m"
export _BWHT="\\033[1;37m"

debug() {
  msg=$1
  color=${2:-${_NORM}}
  echo -e "${color}${msg}${_NORM}"
}

function setup_common {
  debug "Configuring base16-shell" "${_GRN}"
  if [[ ! -e ~/.config/base16-shell ]]
  then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  fi

  debug "Installing asdf" "${_GRN}"
  if [[ ! -e ~/.asdf ]]
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  fi

  . $HOME/.asdf/asdf.sh
  asdf update
  asdf plugin-update --all

  if [[ "$SHELL" != $(which zsh) ]]; then
    debug "Installing asdf" "${_GRN}"
    chsh -s $(which zsh)
  fi

  debug "Pulling Thoughtbot Dotfiles" "${_GRN}"
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


  debug "Installing Dotfiles" "${_GRN}"
  rcup -f -d $TB_DOTFILES -x gitconfig -x '*.md' -x LICENSE -x hushlogin -x rcrc
  rcup -f -d $MY_DOTFILES -x README.md -x '*.sh'

  debug "Linking for neovim" "${_GRN}"
  if [[ ! -e ~/.config/nvim ]]; then
    ln -s ~/.vim ~/.config/nvim
  fi
  if [[ ! -e ~/.config/nvim/init.vim ]]; then
    ln -s ~/.vimrc ~/.config/nvim/init.vim
  fi

  debug "All the asdf plugins" "${_GRN}"
  asdf plugin-add 1password-cli
  asdf plugin-add bat
  asdf plugin-add go-jsonnet
  asdf plugin-add golang
  asdf plugin-add helm
  asdf plugin-add helmfile
  asdf plugin-add jsonnet-bundler
  asdf plugin-add k9s
  asdf plugin-add kind
  asdf plugin-add kubectl
  asdf plugin-add kubespy
  asdf plugin-add kubetail
  asdf plugin-add kustomize
  asdf plugin-add minikube
  asdf plugin-add minio
  asdf plugin-add neovim
  asdf plugin-add nodejs
  asdf plugin-add postgres
  asdf plugin-add python
  asdf plugin-add redis
  asdf plugin-add ruby
  asdf plugin-add tanka
  asdf plugin-add terraform
  asdf plugin-add vagrant
  asdf plugin-add vim
  asdf plugin-add yarn
  asdf plugin-add yq


  debug "Clone zsh auto suggestion" "${_GRN}"
  if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  fi

  debug "For some reason I unlink this file" "${_GRN}"
  unlink ~/.zsh/configs/keybindings.zsh
}
