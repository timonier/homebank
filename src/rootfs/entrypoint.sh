#!/bin/sh

[ -n "$LANG" ] && locale-gen $LANG > /dev/null 2>&1

gosu "$USER" "$@"
