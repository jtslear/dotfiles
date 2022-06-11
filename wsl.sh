#!/bin/bash

function is_wsl {
  if uname -r | grep -q WSL
  then
    debug "We are inside of a WSL environment" "${_GRN}"
  else
    debug "WSL Environment not detected" "${_RED}"
    return
  fi
}

function setup_wsl {
  if is_wsl
  then
    debug "Updating a bunch of packages..." "${_GRN}"
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
