#!/bin/bash

[[ -n $LANG ]] && locale-gen $LANG > /dev/null 2>&1

sudo -u "$USER" -EH "$@"
