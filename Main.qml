import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Kaffeemaschine

Window {
    id: main
    width: 800
    height: 600
    visible: true
    title: qsTr("Kaffeemaschine")

    Backend {
        id: myBackend
    }

    Rectangle {
        id: sidebar
        width: parent.width * (mouse.hovered ? 0.4 : 0.2)
        height: parent.height
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
            model: myBackend.generateDataModel()

            delegate: Rectangle {
                required property string name
                required property string bgColorNorm
                required property string bgColorHover

                id: lmButton
                height: 50
                width: parent.width

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

                    onClicked:
                    {
                        console.log("Clicked " + name)
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
        }

        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }

    Rectangle {
        id: contentWnd
        x: sidebar.width
        width: main.width - sidebar.width
        height: main.height
        color: "#e84118"

        Text {
            text: "Test text"
            color: "#353b48"
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 32
        }
    }
}
