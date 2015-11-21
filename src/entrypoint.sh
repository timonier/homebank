#!/bin/bash
set -e

[[ -n $LANG ]] && locale-gen $LANG > /dev/null 2>&1

sudo -u $USER -EH /usr/bin/homebank "$@" 2> /dev/null
