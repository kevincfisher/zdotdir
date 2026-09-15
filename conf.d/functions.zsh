#!/usr/bin/env zsh

function allexts {
  find . -not \( -path '*/.git/*' -prune \) -type f -name '*.*' | sed 's|.*\.|\.|' | sort | uniq -c
}

##? Backup files or directories
function bak {
  local now f
  now=$(date +"%Y%m%d-%H%M%S")
  for f in "$@"; do
    if [[ ! -e "$f" ]]; then
      echo "file not found: $f" >&2
      continue
    fi
    cp -R "$f" "$f".$now.bak 
  done
}

function noext {
  find . -not \( -path '*/.git/*' -prune \) -type f ! name '*.*'
}

function tailf {
  local nl
  tail -f $2 | while read j; do
    print -n "$nl$j"
    nl="\n"
  done
}

function touchf {
  if [[ -n "$1" ]] && [[ ! -f "$1" ]]; then
    mkdir -p "$1:h" && touch "$1"
  fi
}


