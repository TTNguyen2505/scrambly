import QtQuick
import Scrambly.DesignSystem

Item {
    implicitWidth: 480
    implicitHeight: 84

    Column {
        anchors.centerIn: parent
        spacing: 16

        ProgressBar {
            width: 480
            height: implicitHeight
            percentage: 29.5
        }

        ProgressBar {
            width: 480
            height: implicitHeight
            percentage: 100
        }
    }
}
