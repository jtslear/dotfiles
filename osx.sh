#!/bin/bash

function setup_osx {
  if [[ ! $(type brew) ]]; then
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew tap thoughtbot/formulae && brew install rcm

  brew update
  brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
  brew install \
    ag \
    ansible \
    bash-completion \
    gnupg \
    gpg \
    gpg-agent \
    heroku \
    hub \
    jq \
    nmap \
    nvm \
    pinentry-mac \
    socat \
    tmux \
    tree \
    watch

  brew upgrade
}
