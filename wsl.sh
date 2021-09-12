#!/bin/bash

function is_wsl {
  if uname -r | grep -q WSL
  then
    echo "We are inside of a WSL environment"
  else
    echo "WSL Environment not detected"
    return
  fi
}

function setup_wsl {
  if is_wsl
  then
    sudo apt-get update
    sudo apt-get install \
      silversearcher-ag \
      bash-completion \
      gnupg \
      gpg \
      gpg-agent \
      jq \
      nmap \
      socat \
      tmux \
      tree \
      watch \
      zsh
  fi
}
