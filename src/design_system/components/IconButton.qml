import QtQuick
import QtQuick.Templates as T
import QtQuick.Effects
import Scrambly.DesignSystem

T.Button {
    id: root

    property string size: "Small"
    property url iconSource: "qrc:/assets/images/icons/ic_play.svg"
    property string accessibleLabel: ""
    property string visualState: "Auto"
    property real iconSize: -1

    text: accessibleLabel
    hoverEnabled: true
    padding: 0

    readonly property real resolvedIconSize: iconSize > 0 ? iconSize : size === "Extra Small" ? SemanticSizes.iconXs : SemanticSizes.iconSm
    readonly property real resolvedBorderWidth: SemanticBorderWidth.subtle
    readonly property bool isInteractive: visualState === "Auto" || visualState === "Default" || visualState === ""
    readonly property bool visualDisabled: !enabled || visualState === "Disabled"
    readonly property bool visualPressed: !visualDisabled && (visualState === "Pressed" || (isInteractive && pressed))
    readonly property bool visualHovered: !visualDisabled && !visualPressed && (visualState === "Hover" || (isInteractive && hovered))
    readonly property color resolvedSurfaceColor: visualDisabled ? SemanticColors.surfaceDisabled : visualPressed ? SemanticColors.surfaceCanvas : visualHovered ? SemanticColors.surfacePrimaryCta : SemanticColors.surfacePanel
    readonly property color resolvedBorderColor: visualDisabled ? SemanticColors.borderDisabled : SemanticColors.borderDefault
    readonly property color resolvedIconTint: visualDisabled ? SemanticColors.textDisabled : SemanticColors.textPrimary
    readonly property var resolvedElevation: visualDisabled ? EffectStyles.elevationDepth0 : visualPressed ? EffectStyles.elevationDepth50 : visualHovered ? EffectStyles.elevationDepth200 : EffectStyles.elevationDepth100
    readonly property real targetTranslate: visualDisabled ? 0 : visualPressed ? 1 : visualHovered ? -2 : 0
    property real visualTranslate: targetTranslate

    implicitWidth: resolvedIconSize + 2 * (SemanticSizes.space2xs + resolvedBorderWidth)
    implicitHeight: resolvedIconSize + 2 * (SemanticSizes.space2xs + resolvedBorderWidth)

    Behavior on visualTranslate {
        NumberAnimation {
            duration: (root.visualHovered || root.visualPressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: (root.visualHovered || root.visualPressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
        }
    }

    HoverHandler {
        target: null
        cursorShape: root.visualDisabled ? Qt.ForbiddenCursor : Qt.PointingHandCursor
    }

    contentItem: Item {
        implicitWidth: root.resolvedIconSize
        implicitHeight: root.resolvedIconSize

        transform: Translate {
            x: root.visualTranslate
            y: root.visualTranslate
        }

        Image {
            anchors.fill: parent
            source: root.iconSource
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            sourceSize: Qt.size(Math.max(1, Math.round(root.resolvedIconSize * (Screen.devicePixelRatio ? Screen.devicePixelRatio : 1) * 2)), Math.max(1, Math.round(root.resolvedIconSize * (Screen.devicePixelRatio ? Screen.devicePixelRatio : 1) * 2)))
            layer.enabled: status === Image.Ready
            layer.smooth: true
            layer.mipmap: true
            layer.effect: MultiEffect {
                brightness: 1.0
                colorization: 1.0
                colorizationColor: root.resolvedIconTint
            }
        }
    }

    background: Rectangle {
        color: root.resolvedSurfaceColor
        border.color: root.resolvedBorderColor
        border.width: root.resolvedBorderWidth
        radius: 0

        transform: Translate {
            x: root.visualTranslate
            y: root.visualTranslate
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
                    duration: (root.visualHovered || root.visualPressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: (root.visualHovered || root.visualPressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                }
            }

            Behavior on shadowVerticalOffset {
                NumberAnimation {
                    duration: (root.visualHovered || root.visualPressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: (root.visualHovered || root.visualPressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                }
            }
        }
    }
}
