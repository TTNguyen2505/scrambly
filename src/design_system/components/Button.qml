import QtQuick
import QtQuick.Templates as T
import QtQuick.Effects
import Scrambly.DesignSystem

T.Button {
    id: root

    property string label: "Label"
    property string variant: "Primary"
    property string size: "Default"
    text: label
    property url leadingIconSource: "qrc:/assets/images/icons/ic_play.svg"
    property url trailingIconSource: "qrc:/assets/images/icons/ic_play.svg"
    property bool showLeadingIcon: true
    property bool showTrailingIcon: true

    readonly property bool isInverseOrDestructive: variant === "Inverse" || variant === "Invese" || variant === "Destructive"
    readonly property color resolvedDefaultIconTint: !enabled ? SemanticColors.textDisabled : isInverseOrDestructive ? SemanticColors.textInverse : SemanticColors.textPrimary
    property color iconTint: resolvedDefaultIconTint
    readonly property color resolvedIconTint: isInverseOrDestructive ? SemanticColors.textInverse : iconTint

    property real iconSize: -1
    property real iconWidth: -1
    property real iconHeight: -1
    property real iconTextSpacing: -1
    property real buttonHorizontalPadding: -1
    property real buttonHeight: -1

    hoverEnabled: true

    readonly property real resolvedIconSize: iconSize > 0 ? iconSize : size === "Small" ? SemanticSizes.iconXs : SemanticSizes.iconSm
    readonly property real resolvedIconWidth: iconWidth > 0 ? iconWidth : resolvedIconSize
    readonly property real resolvedIconHeight: iconHeight > 0 ? iconHeight : resolvedIconSize
    readonly property real resolvedHorizontalPadding: buttonHorizontalPadding >= 0 ? buttonHorizontalPadding : size === "Small" ? SemanticSizes.spaceXs : SemanticSizes.spaceMd
    readonly property real resolvedVerticalPadding: size === "Small" ? SemanticSizes.space2xs : SemanticSizes.spaceXs
    readonly property real resolvedIconTextSpacing: iconTextSpacing >= 0 ? iconTextSpacing : size === "Small" ? SemanticSizes.space3xs : SemanticSizes.spaceXs
    readonly property real resolvedBorderWidth: SemanticBorderWidth.defaultWidth
    readonly property real resolvedLineHeight: size === "Small" ? TextStyles.buttonSM.lineHeight : TextStyles.buttonDefault.lineHeight
    readonly property var resolvedElevation: !enabled ? EffectStyles.elevationDepth0 : pressed ? EffectStyles.elevationDepth50 : hovered ? EffectStyles.elevationDepth200 : EffectStyles.elevationDepth100
    readonly property color resolvedSurfaceColor: !enabled ? SemanticColors.surfaceDisabled : variant === "Secondary" ? SemanticColors.surfacePanel : variant === "Destructive" ? SemanticColors.surfaceFeedbackDanger : isInverseOrDestructive ? SemanticColors.surfaceInverse : SemanticColors.surfacePrimaryCta
    readonly property color resolvedTextColor: !enabled ? SemanticColors.textDisabled : isInverseOrDestructive ? SemanticColors.textInverse : SemanticColors.textPrimary
    readonly property color resolvedBorderColor: enabled ? SemanticColors.borderDefault : SemanticColors.borderDisabled

    readonly property real targetTranslateX: !enabled ? 0 : pressed ? 1 : hovered ? -2 : 0
    readonly property real targetTranslateY: !enabled ? 0 : pressed ? 1 : hovered ? -2 : 0

    property real visualTranslateX: targetTranslateX
    property real visualTranslateY: targetTranslateY

    Behavior on visualTranslateX {
        NumberAnimation {
            duration: (root.hovered || root.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: (root.hovered || root.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
        }
    }

    Behavior on visualTranslateY {
        NumberAnimation {
            duration: (root.hovered || root.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: (root.hovered || root.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
        }
    }

    padding: 0
    leftPadding: resolvedHorizontalPadding + resolvedBorderWidth
    rightPadding: resolvedHorizontalPadding + resolvedBorderWidth
    topPadding: resolvedVerticalPadding + resolvedBorderWidth
    bottomPadding: resolvedVerticalPadding + resolvedBorderWidth
    implicitWidth: contentRow.implicitWidth + 2 * (resolvedHorizontalPadding + resolvedBorderWidth)
    implicitHeight: buttonHeight >= 0 ? buttonHeight : Math.max(resolvedIconHeight, resolvedLineHeight) + 2 * (resolvedVerticalPadding + resolvedBorderWidth)

    HoverHandler {
        id: hoverHandler
        target: null
        cursorShape: !root.enabled ? Qt.ForbiddenCursor : Qt.PointingHandCursor
    }

    contentItem: Item {
        implicitWidth: contentRow.implicitWidth
        implicitHeight: contentRow.implicitHeight

        transform: Translate {
            x: root.visualTranslateX
            y: root.visualTranslateY
        }

        Row {
            id: contentRow
            anchors.centerIn: parent
            width: implicitWidth
            height: implicitHeight
            spacing: 0

            IconSlot {
                id: leadingIcon
                y: (parent.height - height) / 2
                source: root.leadingIconSource
                tint: root.resolvedIconTint
                requestedWidth: root.resolvedIconWidth
                requestedHeight: root.resolvedIconHeight
                enabledSlot: root.showLeadingIcon
            }

            Item {
                y: (parent.height - height) / 2
                width: leadingIcon.visible && labelText.visible ? root.resolvedIconTextSpacing : 0
                height: 1
            }

            Text {
                id: labelText
                y: (parent.height - height) / 2
                visible: root.label.length > 0
                text: root.label
                color: root.resolvedTextColor
                font.family: TextStyles.buttonDefault.family
                font.pixelSize: root.size === "Small" ? TextStyles.buttonSM.pixelSize : TextStyles.buttonDefault.pixelSize
                font.weight: root.size === "Small" ? TextStyles.buttonSM.weight : TextStyles.buttonDefault.weight
                lineHeight: root.resolvedLineHeight
                lineHeightMode: Text.FixedHeight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
            }

            Item {
                y: (parent.height - height) / 2
                width: trailingIcon.visible && labelText.visible ? root.resolvedIconTextSpacing : 0
                height: 1
            }

            IconSlot {
                id: trailingIcon
                y: (parent.height - height) / 2
                source: root.trailingIconSource
                tint: root.resolvedIconTint
                requestedWidth: root.resolvedIconWidth
                requestedHeight: root.resolvedIconHeight
                enabledSlot: root.showTrailingIcon
            }
        }
    }

    background: Rectangle {
        color: root.resolvedSurfaceColor
        border.color: root.resolvedBorderColor
        border.width: root.resolvedBorderWidth
        radius: 0

        transform: Translate {
            x: root.visualTranslateX
            y: root.visualTranslateY
        }

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: root.resolvedElevation.enabled
            shadowColor: root.resolvedElevation.color
            shadowHorizontalOffset: root.resolvedElevation.offsetX
            shadowVerticalOffset: root.resolvedElevation.offsetY
            shadowBlur: root.resolvedElevation.blur

            Behavior on shadowHorizontalOffset {
                NumberAnimation {
                    duration: (root.hovered || root.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: (root.hovered || root.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                }
            }

            Behavior on shadowVerticalOffset {
                NumberAnimation {
                    duration: (root.hovered || root.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: (root.hovered || root.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                }
            }
        }
    }

    component IconSlot: Item {
        id: iconSlot

        property url source
        property color tint: SemanticColors.textPrimary
        property real requestedWidth: SemanticSizes.iconSm
        property real requestedHeight: SemanticSizes.iconSm
        property bool enabledSlot: true
        readonly property bool loaded: enabledSlot && source.toString().length > 0 && iconImage.status === Image.Ready

        visible: loaded
        width: loaded ? requestedWidth : 0
        height: loaded ? requestedHeight : 0

        Image {
            id: iconImage
            anchors.fill: parent
            source: iconSlot.source
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            sourceSize: Qt.size(Math.max(1, Math.round(iconSlot.requestedWidth * (Screen.devicePixelRatio ? Screen.devicePixelRatio : 1) * 2)), Math.max(1, Math.round(iconSlot.requestedHeight * (Screen.devicePixelRatio ? Screen.devicePixelRatio : 1) * 2)))

            layer.enabled: iconSlot.loaded
            layer.smooth: true
            layer.mipmap: true
            layer.effect: MultiEffect {
                brightness: 1.0
                colorization: 1.0
                colorizationColor: iconSlot.tint
            }
        }
    }
}
