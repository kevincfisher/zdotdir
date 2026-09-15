#!/usr/bin/env zsh
# === ALIASES ===
alias ping='ping -c 5'
alias vim=nvim
alias nv=nvim
alias grep="${aliases[grep]:-grep} --exclude-dir={.git}"

# files 
alias ll='ls -lh'
alias la='ls -lAh'
alias lsa="ls -aG"
alias ldot='ls -ld .*'
if (( ${+commands[eza]} )); then
  alias ls=eza
  [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/eza ]] && \
    export EZA_CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/eza
fi

if (( ${+commands[zoxide]} )); then
  alias cd=z
  if [[ -z ${XDG_DATA_HOME:-$HOME/.local/share}/zoxide ]]; then
    echo "creating zoxide data folder in $HOME/.local/share"
    mkdir -p $HOME/.local/share/zoxide
  fi

  [[ -d ${XDG_DATA_HOME:-$HOME/.local/share}/zoxide ]] && \
    export ZO_DATA_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/zoxide
  eval "$(zoxide init zsh)"
fi

#tar
alias tarls="tar -tvf"
alias untar="tar -xf"

#date/time
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias datestamp="date '+%Y-%m-%d'"
alias isodate="date +%Y-%m-%dT%H:%M:%S%z"
alias unixepoch="date +%s"

# disk usage
alias biggest='du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh'

alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
