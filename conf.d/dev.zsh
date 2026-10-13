# === Dev Settings ===
# Place things relating to development here (setting path vars for tools and langs etc.)

export CARGO_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/cargo
if [[ -e "$CARGO_HOME/.cargo" ]]; then
  . "$CARGO_HOME/.cargo"
fi


