import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id: main
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: sidebar
        width: parent.width * (mouse.hovered ? 0.4 : 0.2)
        height: parent.height
        color: "#2f3640"

        ListModel {
            id: listModel
            ListElement {
                name: "A"
                eColor:"#00a8ff"
                hoverColor: "#0097e6"
            }
            ListElement {
                name: "B"
                eColor: "#9c88ff"
                hoverColor: "#8c7ae6"
            }
            ListElement {
                name: "C"
                eColor: "#fbc531"
                hoverColor: "#e1b12c"
            }
            ListElement {
                name: "D"
                eColor: "#4cd137"
                hoverColor: "#44bd32"
            }
            ListElement {
                name: "E"
                eColor: "#487eb0"
                hoverColor: "#40739e"
            }

        }

        ListView{
            ScrollBar.vertical: ScrollBar {
                parent: Flickable.parent
                anchors.top: Flickable.top
                anchors.left: Flickable.left
                anchors.bottom: Flickable .bottom
                height: parent.height
            }
            anchors {
                fill: parent
                margins: 20
            }
            spacing: 10


            model: listModel
            delegate: Rectangle {
                required property string name
                required property string eColor
                required property string hoverColor
                id: lmButton
                height: 50
                width: parent.width

                anchors.leftMargin: 10
                anchors.topMargin: 10

                color: listElemHandler.hovered ? lmButton.hoverColor : lmButton.eColor

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

        /*RowLayout {
            id: layout
            anchors.fill: parent
            spacing: 6

            Rectangle {
                width: main.width * 0.2
                height: main.height * 0.4
                color: "#4cd137"
            }
            Rectangle {
                width: main.width * 0.2
                height: main.height * 0.4
                color: "#e84118"
            }
            Rectangle {
                width: main.width * 0.2
                height: main.height * 0.4
                color: "#487eb0"
            }
            Rectangle {
                width: main.width * 0.2
                height: main.height * 0.4
                color: "#273c75"
            }
            Rectangle {
                width: main.width * 0.2
                height: main.height * 0.4
                color: "#00a8ff"
            }
*/
        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }
}
