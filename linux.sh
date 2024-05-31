#!/bin/bash

function setup_linux {
  if is_wsl
  then
    debug "Detecting WSL..." "${_GRN}"
    setup_wsl
  else
    debug "Updating a bunch of packages..." "${_GRN}"
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

  # debug "Installing font..." "${_GRN}"
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

  debug "Installing rcup..." "${_GRN}"
  sudo add-apt-repository --yes ppa:martin-frost/thoughtbot-rcm
  sudo apt-get install -y rcm
}
