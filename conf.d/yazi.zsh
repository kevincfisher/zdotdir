#! /usr/bin/env zsh

if ! (( $+commands[yazi] )); then
  print -ru2 "[skipping init] yazi not found on system"
  return 1
fi
