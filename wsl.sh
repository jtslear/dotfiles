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
      bash-completion \
      cmake \
      gnupg \
      gpg \
      gpg-agent \
      jq \
      libgrpc-dev \
      make \
      nmap \
      protobuf-compiler-grpc \
      python3-grpc-tools \
      silversearcher-ag \
      socat \
      tmux \
      tree \
      unzip \
      watch \
      zsh
  fi
}
