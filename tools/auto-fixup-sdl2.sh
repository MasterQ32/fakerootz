#!/usr/bin/env bash

set -euo pipefail

file="$1"


sed -ri                                         \
    -e 's~^(/\*\*)|^( \*[ ]?)|^( \*/)~/// ~'    \
    -e 's~\*/~~'                                \
    -e 's~/\*\*<~///<~'                         \
    -e 's~typedef enum~type  = enum~'           \
    -e 's~typedef ([a-z]+)~type  = \1~'         \
    -e 's~^extern DECLSPEC ~fn ~'               \
    -e 's~ SDLCALL SDL_~ SDL_~'                 \
    -e 's~\(void\)~()~'                         \
    "$file"
