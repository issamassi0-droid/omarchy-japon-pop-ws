#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="japon_pop_ws"
THEMES_DIR="$HOME/.config/omarchy/themes"
THEME_DIR="$THEMES_DIR/$THEME_NAME"
HOOK_DST_DIR="$HOME/.config/omarchy/hooks/theme-set.d"
HOOK_DST="$HOOK_DST_DIR/japon_pop_ws-theme-set.sh"

if [[ ! -d "$THEME_DIR" ]]; then
  echo "ERROR: Theme directory not found: $THEME_DIR"
  exit 1
fi

mkdir -p "$HOOK_DST_DIR"
cp "$THEME_DIR/hooks/japon_pop_ws-theme-set.sh" "$HOOK_DST"
chmod +x "$HOOK_DST"
echo "Installed theme-set hook: $HOOK_DST"

echo "Applying theme '$THEME_NAME' ..."
omarchy theme set japon_pop_ws

echo "Done. Japon Pop WS is active."
echo "Palette: darken orange (#c4682a) · darken cyan (#3a8a8a) · darken yellow (#a89030)"