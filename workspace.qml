import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    color: "#141210"

    property int workspaceNum: 0
    property bool active: false
    property bool occupied: false
    property bool urgent: false

    implicitWidth: 24
    implicitHeight: 18

    Rectangle {
        anchors.fill: parent
        radius: 7
        color: urgent ? "#ff0000" : (active ? "#c4682a" : (occupied ? Qt.rgba(239/255, 174/255, 100/255, 0.13) : Qt.rgba(20/255, 18/255, 16/255, 0.45)))
        border.color: urgent ? "#ffa500" : (active ? Qt.rgba(235/255, 75/255, 35/255, 0.45) : (occupied ? Qt.rgba(235/255, 160/255, 60/255, 0.38) : Qt.rgba(196/255, 104/255, 42/255, 0.2)))
        border.width: 1

        Text {
            anchors.centerIn: parent
            text: String(root.workspaceNum)
            color: urgent ? "#ff0000" : (active ? "#e0a45f" : (occupied ? "#efae64" : "#d1ccc3"))
            font.family: "MonoLisa"
            font.pixelSize: 10
            font.bold: false
            renderType: Text.NativeRendering
        }
    }
}