#!/usr/bin/env bash

###############################################################################
# 2017 David Deal
###############################################################################

###############################################################################
# Script options
###############################################################################
set -e # exit on error
set -o pipefail # exit on pipe fails
#set -u # fail on unset
#set -x # activate debugging from here down
#set +x # disable debugging from here down
# First set bash option to avoid
# unmatched patterns expand as result values
#shopt -s nullglob

###############################################################################
# Determine the current script's directory
###############################################################################
declare -r DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

###############################################################################
# Load the color definitions
###############################################################################
if [[ -f "$DIR/colors.sh" ]]; then
  . "$DIR/colors.sh"
else
  echo "Unable to source: colors.sh"
  exit 1
fi

###############################################################################
# Load the logger definitions
###############################################################################
if [[ -f "$DIR/logger.sh" ]]; then
  . "$DIR/logger.sh"
else
  echo "Unable to source: logger.sh"
  exit 1
fi

###############################################################################
# Validate the template
###############################################################################
if [[ -z "$1" ]]; then
    echo "Missing input parameter"
    echo "Usage:   $0 <cloud-formation-template.json>"
    echo "Example: $0 td-template.json"
    echo "Exiting..."
    exit -1
fi

log "Validating template: ${_Y}${1}${_W}..."
aws cloudformation validate-template --template-body file://${1}
