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

  sudo add-apt-repository --yes ppa:martin-frost/thoughtbot-rcm
  sudo apt-get install -y rcm
}
