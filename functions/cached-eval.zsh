function cached-eval () {
  local sourcefile=""

  () {
    emulate -L zsh
    setopt local_options extended_glob

    local cachedir=$ZSH_CACHE_DIR/cached-eval
    [[ -n "$ZSH_CACHE_DIR" ]] || return 1

    # set clear flag (e.g. cached-eval --clear [...args]
    local -i clear=0
    [[ "$1" == --clear ]] && { clear=1; shift }

    # no additional args clears the entire cache\
    if (( clear && ! $# )); then
      command rm -rf $cachedir/*(N.)
      return
    fi
    (( $# )) || return 1

    # hash whole command line, so different args hit different caches
    local c
    local -i hash=5381
    for c in ${(s::)${(j: :)@}}; do
      (( hash = (hash * 33 + #c) % 4294967296 ))
    done
    local cachefile=$cachedir/${1:t}-${hash}.zsh

    if (( clear )); then
      command rm -rf $cachefile
      return
    fi

    if [[ -z $cachefile(#qNmh-20) ]]; then
      mkdir -p $cachefile:h
      if ! "$@" >| $cachefile.$$; then
        command rm -f $cachefile.$$
        return 1
      fi
      command mv -f $cachefile.$$ $cachefile
    fi

    sourcefile=$cachefile

  } "$@" || return 1

  [[ -n "$sourcefile" ]] || return 0 # -- clear leaves nothing to source
  source $sourcefile
}
