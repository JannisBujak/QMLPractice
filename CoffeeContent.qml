import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Kaffeemaschine

Item {
    id :root

    Rectangle {
        anchors.fill: parent

        color: (selectedModell != null) ? selectedModell.bgColorHover : "#7f8fa6"

        Text {
            text: (selectedModell != null) ? selectedModell.name : ""
            color: "#353b48"
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 32
        }
    }
}
