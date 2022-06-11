#!/bin/bash

source common.sh
source linux.sh
source osx.sh
source wsl.sh

case ${OSTYPE} in
  "darwin19")
    setup_osx
    ;;
  "linux-gnu")
    setup_linux
    ;;
  *)
    debug "Unable to complete setup..." "${_RED}"
    debug "OSTYPE: ${OSTYPE}"
    ;;
esac

setup_common
