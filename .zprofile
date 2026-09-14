#!/user/bin/env zsh

typeset -gUa path fpath prepath cdpath

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/projects}

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export SHELL_SESSIONS_DISABLE=1 

prepath=(
  $HOME/bin(N)
  /opt/homebrew/bin(N)
  $HOME/.local/bin(N)
)

path=($prepath $path)

cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $cdpath
)
