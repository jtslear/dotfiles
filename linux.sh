#!/bin/bash

function setup_linux {
  if is_wsl
  then
    setup_wsl
  else
    sudo apt-get update
    sudo apt-get install \
      silversearcher-ag \
      bash-completion \
      flameshot \
      gnupg \
      gpg \
      gpg-agent \
      i3 \
      i3lock-fancy \
      jq \
      nmap \
      numlockx \
      ranger \
      redshift-gtk \
      socat \
      tmux \
      tree \
      watch \
      xautolock \
      zsh
  fi

  #if [[ ! -e ~/.fonts/AnonymousPro-1.002.001 ]]
  #then
  #  mkdir ~/.fonts
  #  pushd ~/.fonts
  #  curl -LO https://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip
  #  unzip AnonymousPro-1.002.zip
  #  rm -f AnonymousPro-1.002.zip
  #  fc-cache -v
  #  popd
  #fi

  #if [[ ! -e ~/.config/base16-shell ]]
  #then
  #  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  #fi

  #if [[ ! -e ~/.asdf ]]
  #then
  #  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  #  chmod +x $HOME/.asdf/asdf.sh
  #  chmod +x $HOME/.asdf/completions/asdf.bash
  #fi
  #$HOME/.asdf/asdf.sh
  #asdf update
  #asdf plugin-update --all

  #if [[ "$SHELL" != $(which zsh) ]]; then
  #  echo "changing ${SHELL}"
  #  chsh -s $(which zsh)
  #fi

  #sudo add-apt-repository --yes ppa:martin-frost/thoughtbot-rcm
  #sudo apt-get install -y rcm

  #MY_DOTFILES=$HOME/projects/dotfiles
  #TB_DOTFILES=$HOME/projects/dotfiles-thoughtbot

  #if [ ! -e $TB_DOTFILES ]; then
  #  git clone https://github.com/thoughtbot/dotfiles.git $TB_DOTFILES
  #fi

  #if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
  #  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  #fi

  #pushd $TB_DOTFILES
  #git pull
  #popd

  #pushd $MY_DOTFILES
  #git pull
  #popd

  #rcup -d $TB_DOTFILES -x gitconfig -x README-ES.md -x README.md -x LICENSE -x Brewfile -x rcrc
  #rcup -f -d $MY_DOTFILES -x README.md -x Brewfile -x install -x laptop.local

  #ln -s ~/.vim ~/.config/nvim
  #ln -s ~/.vimrc ~/.config/nvim/init.vim

  #asdf plugin-add golang
  #asdf plugin-add kubectl
  #asdf plugin-add minikube
  #asdf plugin-add ruby
  #asdf plugin-add terraform

  #unlink ~/.zsh/configs/keybindings.zsh
}
