#!/bin/bash
# japon_ws2-theme-set.sh
set -euo pipefail

hyprctl keyword general:col.active_border "rgba(c4682abf)"
hyprctl keyword general:col.inactive_border "rgba(c4682a55)"

if pgrep -x quickshell >/dev/null 2>&1; then
    quickshell -r &
fi
echo "Japon WS2 theme hook applied."