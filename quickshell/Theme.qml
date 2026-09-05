// Theme.qml — Japon WS2 for Quickshell
// Colors derived from pop.workspace plugin
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

    readonly property color border: Qt.rgba(196/255, 104/255, 42/255, 0.75)
    readonly property color borderActive: Qt.rgba(196/255, 104/255, 42/255, 0.95)
    readonly property color borderInactive: Qt.rgba(196/255, 104/255, 42/255, 0.45)

    readonly property color textPrimary: "#d1c8b0"
    readonly property color textSecondary: "#7a7060"
    readonly property color textMuted: "#2a2620"

    readonly property color accent: "#c4682a"
    readonly property color accentAlpha: Qt.rgba(196/255, 104/255, 42/255, 0.75)

    readonly property color buttonBackground: surface1
    readonly property color buttonHover: surface2
    readonly property color buttonActive: surface3

    readonly property color selectionBackground: "#c4682a"
    readonly property color selectionText: "#e09860"

    readonly property color shadow: Qt.rgba(10/255, 10/255, 10/255, 0.267)

    readonly property int borderRadius: 0
    readonly property int borderWidth: 1
    readonly property int spacing: 4
    readonly property int padding: 8

    readonly property int barHeight: 32
    readonly property real barOpacity: 0.95

    readonly property int panelRadius: 8
    readonly property real panelOpacity: 0.95

    // Workspace pill–derived palette
    readonly property color orange: "#c4682a"
    readonly property color cyan:   "#3a8a8a"
    readonly property color yellow: "#a89030"
    readonly property color textFocused:   "#e09860"
    readonly property color textOccupied:  "#c9b26a"
    readonly property color textUnoccupied:"#a89d8c"

    // Workspace pill colors (exact match)
    readonly property color pillBg:      Qt.rgba(122/255, 112/255, 96/255, 0.3)
    readonly property color pillBgBorder: Qt.rgba(138/255, 122/255, 96/255, 0.7)
    readonly property color pillHover:   Qt.rgba(58/255, 138/255, 138/255, 0.55)
    readonly property color pillHoverBorder: Qt.rgba(58/255, 138/255, 138/255, 1.0)
    readonly property color pillOccupied: Qt.rgba(168/255, 144/255, 48/255, 0.4)
    readonly property color pillOccupiedBorder: Qt.rgba(168/255, 144/255, 48/255, 0.75)
    readonly property color pillFocus:   Qt.rgba(196/255, 104/255, 42/255, 0.4)
    readonly property color pillFocusBorder: Qt.rgba(196/255, 104/255, 42/255, 0.75)
}