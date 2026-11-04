import QtQuick
import Scrambly.DesignSystem

Item {
    id: root

    property real percentage: 0
    property string inProgressStatusLabel: "In Progress Status Label"
    property string inProgressMetricLabel: "In Progress Metric Label"
    property string completedStatusLabel: "Completed Status Label"
    property string successMetricLabel: "Success Metric Label"
    property bool showSuccessIcon: true

    readonly property real normalizedPercentage: Math.max(0, Math.min(100, percentage))
    readonly property bool completed: normalizedPercentage >= 100

    implicitWidth: 480
    implicitHeight: header.implicitHeight + SemanticSizes.space2xs + trackContainer.implicitHeight

    Column {
        anchors.fill: parent
        spacing: SemanticSizes.space2xs

        Item {
            id: header
            width: parent.width
            implicitHeight: Math.max(statusGroup.implicitHeight, metricLabel.implicitHeight)
            height: implicitHeight

            Row {
                id: statusGroup
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: SemanticSizes.space2xs

                Image {
                    visible: root.completed && root.showSuccessIcon
                    source: "qrc:/assets/images/icons/ic_success.svg"
                    sourceSize: Qt.size(16, 16)
                    width: 16
                    height: 16
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                }

                AppText {
                    id: statusLabel
                    text: root.completed ? root.completedStatusLabel : root.inProgressStatusLabel
                    textStyle: TextStyles.monoBadge
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            AppText {
                id: metricLabel
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: root.completed ? root.successMetricLabel : root.inProgressMetricLabel
                textStyle: TextStyles.monoBadge
            }
        }

        Rectangle {
            id: trackContainer
            width: parent.width
            implicitWidth: parent.width
            implicitHeight: 14
            color: SemanticColors.surfacePanel
            border.color: SemanticColors.borderDefault
            border.width: SemanticBorderWidth.subtle

            Rectangle {
                anchors.fill: parent
                anchors.margins: SemanticSizes.space3xs + SemanticBorderWidth.subtle
                color: "transparent"
                clip: true

                Rectangle {
                    width: parent.width * root.normalizedPercentage / 100
                    height: parent.height
                    color: root.completed ? SemanticColors.surfaceFeedbackSuccess : SemanticColors.surfacePrimaryCta
                    border.color: SemanticColors.borderDefault
                    border.width: SemanticBorderWidth.subtle
                }
            }
        }
    }
}
