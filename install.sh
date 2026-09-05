#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="japon_ws2"
THEMES_DIR="$HOME/.config/omarchy/themes"
THEME_DIR="$THEMES_DIR/$THEME_NAME"
HOOK_DST_DIR="$HOME/.config/omarchy/hooks/theme-set.d"
HOOK_DST="$HOOK_DST_DIR/japon_ws2-theme-set.sh"

[[ -d "$THEME_DIR" ]] || { echo "ERROR: Theme not found: $THEME_DIR"; exit 1; }

mkdir -p "$HOOK_DST_DIR"
cp "$THEME_DIR/hooks/japon_ws2-theme-set.sh" "$HOOK_DST"
chmod +x "$HOOK_DST"

echo "Applying theme '$THEME_NAME' ..."
omarchy theme set japon_ws2
echo "Done. Japon WS2 is active."