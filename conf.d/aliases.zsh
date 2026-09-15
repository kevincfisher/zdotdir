#!/usr/bin/env zsh
# === ALIASES ===
alias ping='ping -c 5'
alias vi=vim
alias nv=nvim
alias grep="${aliases[grep]:-grep} --exclude-dir={.git}"

# files 
alias ll="eza --color=always"


if (( ${+commands[eza]} )); then
  alias ls=eza
  [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/eza ]] && \
    export EZA_CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/eza
fi

if (( ${+commands[zoxide]} )); then
  alias cd=z
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
alias biggest="du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh"

alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
