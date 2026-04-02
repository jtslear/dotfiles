#!/bin/bash

source common.sh
source linux.sh
source osx.sh

case ${OSTYPE} in
darwin*)
  setup_osx
  ;;
"linux-gnu")
  setup_linux
  ;;
*)
  debug "Unable to complete OS specific setup..." "${_RED}"
  debug "OSTYPE: ${OSTYPE}"
  ;;
esac

setup_common
