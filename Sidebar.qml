import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: sidebar
    property Backend sbBackend: null
    property bool hovered: mouse.hovered
    Rectangle {
        anchors.fill: parent

        color: "#2f3640"

        ListView {

            id: listView
            ScrollBar.vertical: ScrollBar {
                height: parent.height
            }
            anchors {
                fill: parent
                margins: 20
            }

            spacing: 10

            // model: listModel
            model: sbBackend.generateDataModel()

            delegate: Rectangle {
                id: lmButton
                required property string name
                required property string bgColorNorm
                required property string bgColorHover
                height: 50
                width: parent.width
                radius: 5

                anchors.leftMargin: 10
                anchors.topMargin: 10

                color: listElemHandler.hovered ? lmButton.bgColorHover : lmButton.bgColorNorm

                HoverHandler {
                    id: listElemHandler
                    acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                    cursorShape: Qt.PointingHandCursor
                }

                Button {
                    id: btn
                    background: null
                    anchors.fill: parent

                    onClicked: {
                        console.log("Clicked " + name);
                        sbBackend.setDataModel(name);
                    }
                }

                Text {
                    text: name
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 16
                }
            }
        }

        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }
}
