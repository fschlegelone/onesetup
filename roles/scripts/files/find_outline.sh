#!/usr/bin/env bash
# find all files related to outline
find / -type f -iname '*outline*' \
  ! -iname '*.pdf' \
  ! -iname '*.png' \
  ! -iname '*.ttf' \
  ! -iname '*.svg' \
  ! -iname '*.strings' \
  ! -iname '*.h' \
  ! -iname '*.tiff' \
  ! -iname '*.fontinfo' \
  2>/dev/null | fzf | pbcopy
