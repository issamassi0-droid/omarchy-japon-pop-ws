// Theme.qml — Japon Pop WS for Quickshell
// 90s Japanese minimal + Pop workspace pills
pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0

QtObject {
    readonly property color background: "#141210"
    readonly property color foreground: "#d1c8b0"

    readonly property color surface0: "#141210"
    readonly property color surface1: "#1e1c18"
    readonly property color surface2: "#2a2620"
    readonly property color surface3: "#7a7060"

    readonly property color border: Qt.rgba(196/255, 104/255, 42/255, 0.6)
    readonly property color borderActive: Qt.rgba(196/255, 104/255, 42/255, 0.85)
    readonly property color borderInactive: Qt.rgba(196/255, 104/255, 42/255, 0.4)

    readonly property color textPrimary: "#d1c8b0"
    readonly property color textSecondary: "#7a7060"
    readonly property color textMuted: "#2a2620"

    readonly property color accent: "#c4682a"
    readonly property color accentAlpha: Qt.rgba(196/255, 104/255, 42/255, 0.6)

    readonly property color buttonBackground: surface1
    readonly property color buttonHover: surface2
    readonly property color buttonActive: surface3

    readonly property color selectionBackground: surface3
    readonly property color selectionText: foreground

    readonly property color shadow: Qt.rgba(10/255, 10/255, 10/255, 0.267)

    readonly property int borderRadius: 0
    readonly property int borderWidth: 1
    readonly property int spacing: 4
    readonly property int padding: 8

    readonly property int barHeight: 32
    readonly property real barOpacity: 0.95

    readonly property int panelRadius: 8
    readonly property real panelOpacity: 0.95

    // Pop workspace pill colors
    readonly property color pillBg: Qt.rgba(20/255, 18/255, 16/255, 0.45)
    readonly property color pillBorder: Qt.rgba(235/255, 160/255, 60/255, 0.2)
    readonly property color pillHover: Qt.rgba(25/255, 40/255, 45/255, 0.7)
    readonly property color pillHoverBorder: Qt.rgba(60/255, 90/255, 100/255, 1.0)
    readonly property color pillOccupied: Qt.rgba(239/255, 174/255, 100/255, 0.13)
    readonly property color pillOccupiedBorder: Qt.rgba(235/255, 160/255, 60/255, 0.38)
    readonly property color pillFocus: Qt.rgba(225/255, 60/255, 25/255, 0.17)
    readonly property color pillFocusBorder: Qt.rgba(235/255, 75/255, 35/255, 0.45)
    readonly property color pillText: "#d1ccc3"
    readonly property color pillTextOccupied: "#efae64"
    readonly property color pillTextFocus: "#e0a45f"

    // 90s Japanese palette
    readonly property color orange: "#c4682a"
    readonly property color cyan: "#3a8a8a"
    readonly property color yellow: "#a89030"

    // Pop workspace layout
    readonly property int pillW: 20
    readonly property int focusedW: 34
    readonly property int pillH: 18
    readonly property int pillGap: 1
}