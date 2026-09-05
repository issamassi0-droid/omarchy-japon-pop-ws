import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "pop.workspace"

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }
    return null
  }

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5, 6, 7]
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }
    ids.sort(function(a, b) { return a - b })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  property int hoveredWsId: 0
  property var moduleItems: []
  property int _pillCounter: 0

  function triggerPress(button) {
    focusWorkspace(hoveredWsId || currentWsId)
  }

  function registerAllModules() {
    if (!root.bar) return
    for (var i = 0; i < moduleItems.length; i++)
      root.bar.registerClickTarget(moduleItems[i])
  }

  onBarChanged: registerAllModules()

  readonly property int currentWsId: Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id : 1
  readonly property color fg: root.bar ? root.bar.barForeground : Color.foreground
  readonly property color accent: root.bar ? root.bar.urgent : Color.bar.active
  readonly property string ff: root.bar ? root.bar.fontFamily : Style.font.family

  readonly property int wsCount: workspaceIds().length
  readonly property int pillW: 20
  readonly property int focusedW: 34
  readonly property int pillH: 18
  readonly property int pillGap: 1

  // Japon palette — pills tuned to be visible on the near-black bar
  readonly property color bgColor: Qt.rgba(122/255, 112/255, 96/255, 0.3)
  readonly property color bgBorder: Qt.rgba(138/255, 122/255, 96/255, 0.7)
  readonly property color hoverColor: Qt.rgba(58/255, 138/255, 138/255, 0.55)
  readonly property color hoverBorder: Qt.rgba(58/255, 138/255, 138/255, 1.0)
  readonly property color occupiedColor: Qt.rgba(168/255, 144/255, 48/255, 0.4)
  readonly property color occupiedBorder: Qt.rgba(168/255, 144/255, 48/255, 0.75)
  readonly property color focusColor: Qt.rgba(196/255, 104/255, 42/255, 0.4)
  readonly property color focusBorder: Qt.rgba(196/255, 104/255, 42/255, 0.75)
  readonly property color urgentColor: "#c4682a"
  readonly property color urgentBorder: "#a89030"
  readonly property color glowColor: "#c4682a"
  readonly property color glowColorDim: Qt.rgba(196/255, 104/255, 42/255, 0.4)

  implicitWidth: wsCount * pillW + (wsCount - 1) * pillGap + focusedW - pillW
  implicitHeight: root.barSize

  Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    radius: 5
    color: "transparent"

    Row {
      anchors.verticalCenter: parent.verticalCenter
      anchors.left: parent.left
      spacing: root.pillGap

      Repeater {
        model: root.workspaceIds()

        delegate: Rectangle {
          id: pill
          required property int modelData
          readonly property string _pillId: String(modelData)

          readonly property var ws: root.workspaceById(modelData)
          readonly property bool occupied: ws !== null && ws.toplevels.values.length > 0
          readonly property bool urgent: ws !== null && ws.urgent
          readonly property bool focused: root.currentWsId === modelData
          readonly property bool hovered: hArea.containsMouse

          width: focused ? root.focusedW : root.pillW
          height: root.pillH
          radius: 7
          color: urgent ? root.urgentColor : (focused ? root.focusColor : (occupied ? root.occupiedColor : (hovered ? root.hoverColor : root.bgColor)))
          border.width: 1
          border.color: urgent ? root.urgentBorder : (focused ? root.focusBorder : (occupied ? root.occupiedBorder : (hovered ? root.hoverBorder : root.bgBorder)))

          Behavior on width { NumberAnimation { duration: 50; easing.type: Easing.OutCubic } }
          Behavior on height { NumberAnimation { duration: 50; easing.type: Easing.OutCubic } }
          Behavior on color { ColorAnimation { duration: 50 } }
          Behavior on border.color { ColorAnimation { duration: 50 } }

          Item {
            anchors.centerIn: parent
            width: wsText.implicitWidth + 4
            height: wsText.implicitHeight + 4

            Text {
              id: wsText
              anchors.centerIn: parent
              text: pill.modelData === 10 ? "0" : String(pill.modelData)
              // same hue as the pill bg/border, muted but brighter than fill
              color: pill.focused ? "#e09860" : (pill.occupied ? "#c9b26a" : "#a89d8c")
              font.family: root.ff
              font.pixelSize: Style.font.body
              font.bold: pill.focused
              renderType: Text.NativeRendering

              Behavior on color { ColorAnimation { duration: 70 } }
            }

            // soft glow around the number, muted to match
            MultiEffect {
              anchors.centerIn: wsText
              source: wsText
              autoPaddingEnabled: true
              shadowEnabled: pill.focused || pill.occupied
              shadowBlur: 0.6
              shadowColor: pill.focused ? Qt.rgba(196/255, 104/255, 42/255, 0.45) : Qt.rgba(168/255, 144/255, 48/255, 0.45)
              shadowHorizontalOffset: 0
              shadowVerticalOffset: 0
            }
          }

          MouseArea {
            id: hArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
            cursorShape: Qt.PointingHandCursor
            onEntered: root.hoveredWsId = pill.modelData
            onExited: { if (root.hoveredWsId === pill.modelData) root.hoveredWsId = 0 }
            onClicked: root.focusWorkspace(pill.modelData)
          }

          Component.onCompleted: {
            root.moduleItems = root.moduleItems.concat([{id: _pillId, ref: pill}])
            if (root.bar) root.bar.registerClickTarget(pill)
          }
          Component.onDestruction: {
            root.moduleItems = root.moduleItems.filter(function(x) { return x.id !== _pillId })
            if (root.bar) root.bar.unregisterClickTarget(pill)
          }
        }
      }
    }
  }
}