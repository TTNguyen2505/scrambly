import QtQuick
import QtQuick.Templates as T
import Scrambly.DesignSystem

T.Button {
    id: root

    property string label: "Label"
    property string visualState: "Auto"

    text: label
    hoverEnabled: true
    padding: 0

    readonly property bool isInteractive: visualState === "Auto" || visualState === "Default" || visualState === ""
    readonly property bool visualHovered: enabled && (visualState === "Hover" || (isInteractive && hovered))

    implicitWidth: labelText.implicitWidth
    implicitHeight: TextStyles.buttonSM.lineHeight

    HoverHandler {
        target: null
        cursorShape: root.enabled ? Qt.PointingHandCursor : Qt.ForbiddenCursor
    }

    contentItem: AppText {
        id: labelText
        text: root.label
        textStyle: TextStyles.buttonSM
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.underline: true
        wrapMode: Text.NoWrap
    }

    background: Rectangle {
        color: root.visualHovered ? SemanticColors.surfacePrimaryCta : "transparent"
    }
}
