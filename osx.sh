#!/bin/bash

function setup_osx {
  if [[ ! $(type brew) ]]; then
    debug "Installing brew..." "${_GRN}"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  debug "Tapping for some kegs..." "${_GRN}"
  brew tap thoughtbot/formulae && brew install rcm

  debug "Installing all the brew formulas..." "${_GRN}"
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

  debug "Run an upgrade if I haven't run this in awhile..." "${_GRN}"
  brew upgrade
}
