#!/bin/bash
# japon_pop_ws-theme-set.sh — hook for the Japon Pop WS theme
set -euo pipefail

THEME_DIR="$HOME/.config/omarchy/themes/japon_pop_ws"
HOOK_DST_DIR="$HOME/.config/omarchy/hooks/theme-set.d"
HOOK_DST="$HOOK_DST_DIR/japon_pop_ws-theme-set.sh"

hyprctl keyword general:col.active_border "rgba(c4682aff)"
hyprctl keyword general:col.inactive_border "rgba(c4682a55)"

if pgrep -x quickshell >/dev/null 2>&1; then
    quickshell -r &
fi

echo "Japon Pop WS theme hook applied — orange (#c4682a) borders active."