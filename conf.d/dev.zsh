# === Dev Settings ===
# Place things relating to development here (setting path vars for tools and langs etc.)

export CARGO_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/cargo
echo "$CARGO_HOME"
. "$CARGO_HOME/.cargo"
