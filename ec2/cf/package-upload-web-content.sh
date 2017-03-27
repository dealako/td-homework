#!/usr/bin/env bash

###############################################################################
# 2017 David Deal
###############################################################################

###############################################################################
# Script options
###############################################################################
set -e # exit on error
set -o pipefail # exit on pipe fails
set -u # fail on unset
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
# Package and Upload the web content to s3
###############################################################################
s3_bucket="td-homework"
declare -a web_dirs=(web-1 web-2 web-3)

for i in "${web_dirs[@]}"; do
    archive="cloud-formation-${i}.zip"
    [[ -f ${archive} ]] && rm ${archive}
    pushd ${i}
    zip ../${archive} *
    popd
    log "Uploading archive: ${_Y}${archive}${_W}..."
    aws s3 cp ${archive} s3://${s3_bucket}/
done
