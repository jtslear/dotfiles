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
  debug "Installing base16-shell" "${_GRN}"
  if [[ ! -e ~/.config/base16-shell ]]
  then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  fi

  debug "Installing rtx" "${_GRN}"
  rtx_bin_dir="${HOME}/.bin"
  if [[ ! -e "${rtx_bin_dir}/rtx" ]]
  then
    curl -o ${rtx_bin_dir}/rtx https://rtx.pub/rtx-latest-macos-arm64
    chmod +x ${rtx_bin_dir}/rtx
  fi

  rtx install 1password-cli
  rtx install gcloud
  rtx install go-jsonnet
  rtx install golang
  rtx install helm
  rtx install helmfile
  rtx install jq
  rtx install jsonnet-bundler
  rtx install k9s
  rtx install kind
  rtx install kubectl
  rtx install kubespy
  rtx install kustomize
  rtx install minikube
  rtx install minio
  rtx install neovim
  rtx install nodejs
  rtx install postgres
  rtx install python
  rtx install redis
  rtx install ruby
  rtx install tanka
  rtx install terraform
  rtx install vim
  rtx install yarn
  rtx install yq

  if [[ "$SHELL" != $(which zsh) ]]; then
    debug "Changing default shell to zsh" "${_GRN}"
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

  if [[ ! -e ~/.config/nvim ]]; then
    debug "Linking for neovim" "${_GRN}"
    ln -s ~/.vim ~/.config/nvim
  fi
  if [[ ! -e ~/.config/nvim/init.vim ]]; then
    debug "Link something related to neovim" "${_GRN}"
    ln -s ~/.vimrc ~/.config/nvim/init.vim
  fi

  if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    debug "Clone zsh auto suggestion" "${_GRN}"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  fi

  if [ ! -e ~/.zsh/configs/keybindings.zsh ]; then
    debug "For some reason I unlink this file" "${_GRN}"
    unlink ~/.zsh/configs/keybindings.zsh
  fi
}
