if [[ -z $HOME/.local/bin/fast-syntax-highlighting ]]; then
  local fsh_dir="$HOME/.local/bin/fast-syntax-highlighting"
  mkdir -p $fsh_dir
  cd $fsh_dir && git clone git@github.com:zdharma-continuum/fast-syntax-highlighting.git .

  source "$fsh_dir/fast-syntax-highlighting.plugin.zsh" 
fi
