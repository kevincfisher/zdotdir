#!/usr/bin/env zsh
#
# .zshenv: Env files, loaded first (bootstrapped from $HOME/.zshenv)
#

# Set base zsh config
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# ZSH metadata
export ZSH_CACHE_HOME=${ZSH_CACHE_HOME:-$XDG_CACHE_HOME/zsh}
export ZSH_DATA_HOME=${ZSH_DATA_HOME:-$XDG_DATA_HOME/zsh}
export ZSH_STATE_HOME=${ZSH_STATE_HOME:-$XDG_STATE_HOME/zsh}

if [[ ! -o LOGIN ]] && [[ -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
. "$HOME/.cargo/env"
