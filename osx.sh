#!/bin/bash

function setup_osx {
  if [[ ! $(type brew) ]]; then
    debug "Installing brew..." "${_GRN}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  debug "Tapping for some kegs..." "${_GRN}"
  brew tap thoughtbot/formulae && brew install rcm

  debug "Installing all the brew formulas..." "${_GRN}"
  brew update
  brew install \
    ag \
    awscli \
    bash-completion \
    bat \
    ctags \
    coreutils \
    gnupg \
    gpg \
    hub \
    jq \
    libyaml \
    nmap \
    pinentry-mac \
    reattach-to-user-namespace \
    socat \
    tmux \
    tree \
    watch \
    ykman

  brew install --cask amethyst
  brew install --cask 1password/tap/1password-cli

  debug "Run a brew upgrade..." "${_GRN}"
  brew upgrade
}
