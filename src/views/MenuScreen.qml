import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Scrambly
import Scrambly.DesignSystem

ApplicationWindow {
    id: window
    width: 1000
    height: 720
    minimumWidth: 700
    minimumHeight: 480
    visible: true
    title: Strings.appName
    color: SemanticColors.surfaceCanvas

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 16
            spacing: 12

            Button {
                text: "Typography Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/AppTextPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/AppTextPreview.qml"
            }

            Button {
                text: "Button Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/ButtonPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/ButtonPreview.qml"
            }

            Button {
                text: "IconButton Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/IconButtonPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/IconButtonPreview.qml"
            }

            Button {
                text: "TextButton Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/TextButtonPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/TextButtonPreview.qml"
            }

            Button {
                text: "ProgressBar Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/ProgressBarPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/ProgressBarPreview.qml"
            }

            Button {
                text: "Elevation Preview"
                variant: previewLoader.source.toString() === "qrc:/qt/qml/Scrambly/DesignSystem/previews/ElevationPreview.qml" ? "Primary" : "Secondary"
                onClicked: previewLoader.source = "qrc:/qt/qml/Scrambly/DesignSystem/previews/ElevationPreview.qml"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Loader {
                id: previewLoader
                anchors.centerIn: parent
                source: "qrc:/qt/qml/Scrambly/DesignSystem/previews/AppTextPreview.qml"
            }

            Rectangle {
                anchors.fill: parent
                visible: previewLoader.status !== Loader.Ready
                color: "#2c3e50"

                AppText {
                    anchors.centerIn: parent
                    text: Strings.welcomeTitle
                    textStyle: TextStyles.headingLG
                    color: "white"
                }
            }
        }
    }
}
