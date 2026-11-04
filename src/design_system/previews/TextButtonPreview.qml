import QtQuick
import Scrambly.DesignSystem

Item {
    implicitWidth: 61
    implicitHeight: 76

    Column {
        anchors.centerIn: parent
        spacing: 16

        TextButton {
            width: 29
            height: 14
            label: "Label"
            visualState: "Default"
        }

        TextButton {
            width: 29
            height: 14
            label: "Label"
            visualState: "Hover"
        }
    }
}
