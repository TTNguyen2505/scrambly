import QtQuick
import QtQuick.Layouts
import Scrambly.DesignSystem

Item {
    implicitWidth: 104
    implicitHeight: 200

    GridLayout {
        anchors.centerIn: parent
        columns: 2
        columnSpacing: 16
        rowSpacing: 16

        IconButton {
            size: "Small"
            accessibleLabel: "Play"
            visualState: "Default"
            onClicked: console.log("Default icon button clicked")
        }
        IconButton {
            size: "Extra Small"
            accessibleLabel: "Play"
            visualState: "Default"
            onClicked: console.log("Default extra-small icon button clicked")
        }

        IconButton {
            size: "Small"
            accessibleLabel: "Play"
            visualState: "Hover"
            onClicked: console.log("Hovered icon button clicked")
        }
        IconButton {
            size: "Extra Small"
            accessibleLabel: "Play"
            visualState: "Hover"
            onClicked: console.log("Hovered extra-small icon button clicked")
        }

        IconButton {
            size: "Small"
            accessibleLabel: "Play"
            visualState: "Pressed"
            onClicked: console.log("Pressed icon button clicked")
        }
        IconButton {
            size: "Extra Small"
            accessibleLabel: "Play"
            visualState: "Pressed"
            onClicked: console.log("Pressed extra-small icon button clicked")
        }

        IconButton {
            size: "Small"
            accessibleLabel: "Play"
            visualState: "Disabled"
            enabled: false
        }
        IconButton {
            size: "Extra Small"
            accessibleLabel: "Play"
            visualState: "Disabled"
            enabled: false
        }
    }
}
