#!/bin/bash
# japan_pop_ws-theme-set.sh — hook for the Japon Pop WS theme
set -euo pipefail

THEME_DIR="$HOME/.config/omarchy/themes/japon_pop_ws"
HOOK_DST_DIR="$HOME/.config/omarchy/hooks/theme-set.d"
HOOK_DST="$HOOK_DST_DIR/japon_pop_ws-theme-set.sh"
PLUGIN_DIR="$HOME/.config/omarchy/plugins"
SHELL_CONFIG="$HOME/.config/omarchy/shell.json"

# Apply Hyprland border colors
hyprctl keyword general:col.active_border "rgba(c4682aff)"
hyprctl keyword general:col.inactive_border "rgba(c4682a55)"

# Install pop.mainmenu plugin if not present
if [[ ! -d "$PLUGIN_DIR/pop.mainmenu" ]]; then
  mkdir -p "$PLUGIN_DIR/pop.mainmenu"
  cp "$THEME_DIR/plugins/pop.mainmenu/BarWidget.qml" "$PLUGIN_DIR/pop.mainmenu/BarWidget.qml"
fi

# Ensure shell.json left bar has omarchy.menu + spacer
if command -v jq >/dev/null 2>&1 && [[ -f "$SHELL_CONFIG" ]]; then
  left_ids=$(jq -r '.bar.layout.left[].id' "$SHELL_CONFIG" 2>/dev/null)
  has_menu=$(echo "$left_ids" | grep -c "omarchy.menu" || true)

  if [[ "$has_menu" -eq 0 ]]; then
    jq --arg m "omarchy.menu" \
      '(.bar.layout.left // []) |= [(.. | objects | select(.id == "omarchy.spacer")) as $sp | {id: $m}] + [$sp] + (.bar.layout.left // [])' \
      "$SHELL_CONFIG" > "$SHELL_CONFIG.tmp" && mv "$SHELL_CONFIG.tmp" "$SHELL_CONFIG"
  fi
fi

# Reload quickshell
if pgrep -x quickshell >/dev/null 2>&1; then
    quickshell -r &
fi

echo "Japon Pop WS theme hook applied."