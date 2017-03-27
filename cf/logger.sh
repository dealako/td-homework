#!/usr/bin/env bash

###############################################################################
# Logger definitions
###############################################################################
debug_enabled=1
log() {
  echo -e "${_W}[${_N}${_Y}`date +'%Y%m%d %T %Z'`${_N}${_W}][${_N}${_GREEN}INFO${_N}${_W}]${_N} ${_W}$@${_N}"
}

log_warn() {
  echo -e "${_W}[${_N}${_Y}`date +'%Y%m%d %T %Z'`${_N}${_W}][${_N}${_RED}WARN${_N}${_W}]${_N} ${_W}$@${_N}"
}

log_debug() {
  if [ ${debug_enabled} -ne 0 ]; then
    echo -e "${_W}[${_N}${_Y}`date +'%Y%m%d %T %Z'`${_N}${_W}][${_N}${_BLUE}DEBUG${_N}${_W}]${_N} ${_W}$@${_N}"
  fi
}

# Export to allow other programs to access it
export -f log
export -f log_warn
export -f log_debug
