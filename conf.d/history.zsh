#! /usr/bin/env zsh
# === History config ===

HISTFILE="$ZSH_STATE_HOME/.zhistory"
HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_verify

