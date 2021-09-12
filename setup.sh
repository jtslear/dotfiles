#!/bin/bash

source common.sh
source linux.sh
source osx.sh
source wsl.sh

case ${OSTYPE} in
  "darwin")
    setup_osx
    ;;
  "linux-gnu")
    setup_linux
    ;;
  *)
    echo "Unable to complete setup..."
    ;;
esac

setup_common
