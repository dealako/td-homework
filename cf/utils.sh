#!/usr/bin/env bash

###############################################################################
# 2017 David A. Deal
###############################################################################

###############################################################################
# What to do if we die
###############################################################################
die() {
  log_warn "$@"
  exit 1
}
export -f die

###############################################################################
# Checks whether or not curl is installed and issues a warning on failure.
###############################################################################
checkCurl() {
 if ! which curl >/dev/null; then
    cat <<EOM
cURL is currently NOT installed.
Please install curl for your OS.  e.g.
* sudo yum install curl
* sudo apt-get install curl
* brew install curl
EOM
  fi
}
export -f checkCurl

###############################################################################
# Checks whether or not wget is installed and issues a warning on failure.
###############################################################################
checkWget() {
 if ! which wget >/dev/null; then
    cat <<EOM
wget is currently NOT installed.
Please install wget for your OS.  e.g.
* sudo yum install wget
* sudo apt-get install wget
* brew install wget
EOM
  fi
}
export -f checkWget
