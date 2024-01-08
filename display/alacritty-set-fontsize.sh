#!/usr/bin/env bash
# [Script] @Link ~/.local/bin/alacritty-set-fontsize

if [[ "$#" -eq 0 ]]; then
	cat <<EOF
usage: $0 <FONT_SIZE>
by default size should be set to "15.0"
EOF
	exit 1
fi

sed -Ei -e "s/size = [0-9]+(\.[0-9]*)?/size = $1/" "$HOME/.config/alacritty/alacritty.toml"
