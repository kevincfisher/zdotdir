#!/usr/bin/env zsh

[[ -r $ZDOTDIR/.zstyles ]] \
&& . $ZDOTDIR/.zstyles

# never start at the root
[[ "$PWD" != "/" ]] || cd

source $ZDOTDIR/lib/compinit.zsh
source $ZDOTDIR/lib/confd.zsh

if [[ -r "$HOME/.local/share/deja/init.zsh" ]]; then source "$HOME/.local/share/deja/init.zsh"; else eval "$(deja init zsh)"; fi
