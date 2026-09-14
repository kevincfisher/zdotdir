: ${ZSH_CACHE_HOME:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh}
: ${ZSH_COMPDUMP:=${ZSH_CACHE_HOME:-}/zcompdump-${ZSH_VERSION}}
autoload -Uz compinit

# #q expands globs in the conditional expression
# N - set NULL GLOB (expands to nothing rather than error if nothing found)
# mh-20 files modified less than 20 hours ago
if [[ $ZSH_COMPDUMP(#qNmh-20) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  mkdir -p "$ZSH_COMPDUMP:h"
  compinit -i -d "$ZSH_COMPDUMP"

  # touch updates modified time of existing files without making any changes
  # keeps compdump file younger than the cache time regardless of regeneration
  touch "$ZSH_COMPDUMP"
fi


if [[ ! -e "$ZSH_COMPDUMP.zwc" || "$ZSH_COMPDUMP" -nt "$ZSH_COMPDUMP.zwc" ]]; then
  autoload -Uz zrecompile && zrecompile -pq "$ZSH_COMPDUMP" &!
fi


