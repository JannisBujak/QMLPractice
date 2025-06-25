import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Kaffeemaschine

Window {
    id: main
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    Backend {
        id: myBackend
    }

    Rectangle {
        id: sidebar
        width: parent.width * (mouse.hovered ? 0.4 : 0.2)
        height: parent.height
        color: "#2f3640"

        ListModel {
            id: listModel
            ListElement {
                name: "A"
                colorNorm: "#00a8ff"
                colorHover: "#0097e6"
            }
            ListElement {
                name: "B"
                colorNorm: "#9c88ff"
                colorHover: "#8c7ae6"
            }
            ListElement {
                name: "C"
                colorNorm: "#fbc531"
                colorHover: "#e1b12c"
            }
            ListElement {
                name: "D"
                colorNorm: "#4cd137"
                colorHover: "#44bd32"
            }
            ListElement {
                name: "E"
                colorNorm: "#487eb0"
                colorHover: "#40739e"
            }            

        }

        ListView{
            ScrollBar.vertical: ScrollBar {
                parent: Flickable.parent
                anchors.top: Flickable.top
                anchors.left: Flickable.left
                anchors.bottom: Flickable.bottom
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

        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }

}
