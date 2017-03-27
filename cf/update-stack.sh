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
# Load the utility definitions
###############################################################################
if [[ -f "$DIR/utils.sh" ]]; then
  . "$DIR/utils.sh"
else
  echo "Unable to source: utils.sh"
  exit 1
fi

###############################################################################
# Update the stack
###############################################################################
if [[ -z "$1" ]]; then
    echo "Missing stack name"
    echo "Usage:   $0 <stack-name> <key-name>"
    echo "Example: $0 td-homework aws-sms-oregon-dd"
    echo "Exiting..."
    exit -1
fi
if [[ -z "$2" ]]; then
    echo "Missing SSH key name"
    echo "Usage:   $0 <stack-name> <key-name>"
    echo "Example: $0 td-homework aws-sms-oregon-dd"
    echo "Exiting..."
    exit -1
fi

template_filename="td-template.json"
template_file="file://${template_filename}"
[[ -f ${template_filename} ]] || die "Unable to read template file: ${template_filename}. Exiting..."

log "Validating template: ${_Y}${template_file}${_W}..."
aws cloudformation validate-template --template-body ${template_file}

log "Updating CloudFormation stack-name=${_Y}$1${_W} with KeyPair=${_Y}$2${_W}..."
aws cloudformation update-stack \
   --stack-name $1 \
   --template-body ${template_file} \
   --parameters ParameterKey=KeyPair,ParameterValue=$2
