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

    property CoffeeInfo selectedModell: null;

    Backend {
        id: cppBackend

        onDataModelSelected: (coffee) => {
            selectedModell = coffee
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: sidebar
            sbBackend: cppBackend

            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * (sidebar.hovered ? 0.4 : 0.2)
            Layout.preferredHeight: parent.height
        }


        CoffeeContent {
            id: contentWnd
            Layout.fillHeight: true
            Layout.preferredWidth: main.width - sidebar.width
            Layout.preferredHeight: main.height
        }
    }
}
