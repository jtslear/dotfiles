#!/bin/bash

function setup_linux {
  if is_debian_based
  then
    debug "Updating packages on Debian-based system..." "${_GRN}"
    sudo apt-get update
    sudo apt-get install -y \
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
      rcm \
      tmux \
      tree \
      watch \
      xautolock \
      zsh

  elif is_fedora_based
  then
    debug "Updating packages on Fedora-based system..." "${_GRN}"
    sudo dnf check-update
    sudo dnf install -y \
      the_silver_searcher \
      bash-completion \
      flameshot \
      gnupg \
      gpg \
      gpg-agent \
      i3 \
      jq \
      nmap \
      ranger \
      rcm \
      socat \
      tmux \
      tree \
      watch \
      zsh

  elif is_bazzite_based
  then
    debug "Updating packages on Bazzite system..." "${_GRN}"
    brew install \
      the_silver_searcher \
      rcm \
      zsh
  else
    debug "Unknown Linux distribution. Skipping package installation." "${_RED}"
  fi
}
