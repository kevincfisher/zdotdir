# things that should go at the end of zsh go here
_zrcs=($ZDOTDIR/after/*.{z,}sh(N-.))
for _zrc in ${(o)_zrcs}; do
  [[ "${_zrc:t}" == '~'* ]] || source "$_zrc"
done
unset _zrc{,s}


