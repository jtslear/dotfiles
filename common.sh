#!/bin/bash

function setup_common {
  if [[ ! -e ~/.config/base16-shell ]]
  then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  fi

  if [[ ! -e ~/.asdf ]]
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  fi

  . $HOME/.asdf/asdf.sh
  asdf update
  asdf plugin-update --all

  if [[ "$SHELL" != $(which zsh) ]]; then
    echo "changing ${SHELL}"
    chsh -s $(which zsh)
  fi

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

  rcup -f -d $TB_DOTFILES -x gitconfig -x '*.md' -x LICENSE -x hushlogin -x rcrc
  rcup -f -d $MY_DOTFILES -x README.md -x '*.sh'

  if [[ ! -e ~/.config/nvim ]]; then
    ln -s ~/.vim ~/.config/nvim
  fi
  if [[ ! -e ~/.config/nvim/init.vim ]]; then
    ln -s ~/.vimrc ~/.config/nvim/init.vim
  fi

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


  if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  fi

  unlink ~/.zsh/configs/keybindings.zsh
}
