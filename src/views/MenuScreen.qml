import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Scrambly
import Scrambly.DesignSystem

ApplicationWindow {
    id: window
    width: 900
    height: 700
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: Strings.appName
    color: SemanticColors.surfaceCanvas

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        // Thanh chọn chế độ xem trước Preview (chỉ nạp được trong bản Debug)
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 16
            spacing: 12

            Button {
                text: "Button Preview"
                variant: previewLoader.source.toString().endsWith("ButtonPreview.qml") ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/ButtonPreview.qml"
            }

            Button {
                text: "IconButton Preview"
                variant: previewLoader.source.toString().endsWith("IconButtonPreview.qml") ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/IconButtonPreview.qml"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Loader {
                id: previewLoader
                anchors.centerIn: parent
                source: "qrc:/qt/qml/Scrambly/DesignSystem/previews/IconButtonPreview.qml"
            }

            Rectangle {
                anchors.fill: parent
                visible: previewLoader.status !== Loader.Ready
                color: "#2c3e50"

                Text {
                    anchors.centerIn: parent
                    text: Strings.welcomeTitle
                    color: "white"
                    font.pixelSize: 22
                }
            }
        }
    }
}
