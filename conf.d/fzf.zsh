# === FZF Config ===

if ! (( $+commands[fzf] )); then
  print -ru2 "fzf not found"
  return 1
fi

function init_fzf() {
  if (( $+functions[cached-eval] )); then
    cached-eval fzf --zsh
  else
    source <(fzf --zsh)
  fi
}

# if zsh-vi-mode is installed, defer init
if (( $+functions[zvm_version] )); then
  zvm_after_init_commands+=(init_fzf)
else
  init_fzf
fi


