import QtQuick
import QtQuick.Effects
import Scrambly.DesignSystem

MultiEffect {
    id: root

    // Hỗ trợ truyền trực tiếp đối tượng ElevationStyle (ví dụ: EffectStyles.elevationDepth200)
    // hoặc truyền chuỗi tên token (ví dụ: "elevationDepth200", "200"...)
    property var elevation: EffectStyles.elevationDepth100

    // Bật/tắt animation khi thay đổi mức elevation
    property bool animated: true

    // Trạng thái active (hovered hoặc pressed) để áp dụng duration và easing curve tương ứng từ MotionTokens
    property bool active: false

    readonly property var resolvedElevation: {
        if (typeof elevation === "string") {
            if (EffectStyles[elevation]) {
                return EffectStyles[elevation];
            }
            var prefixed = "elevationDepth" + elevation;
            if (EffectStyles[prefixed]) {
                return EffectStyles[prefixed];
            }
        }
        return elevation || EffectStyles.elevationDepth100;
    }

    readonly property bool isAnimatingShadow: shadowHorizontalOffset !== 0 || shadowVerticalOffset !== 0

    shadowEnabled: (resolvedElevation && resolvedElevation.enabled !== undefined ? resolvedElevation.enabled : true) || (root.animated && isAnimatingShadow)
    shadowColor: resolvedElevation && resolvedElevation.color !== undefined ? resolvedElevation.color : PrimitiveColors.black
    shadowHorizontalOffset: resolvedElevation && resolvedElevation.offsetX !== undefined ? resolvedElevation.offsetX : 0
    shadowVerticalOffset: resolvedElevation && resolvedElevation.offsetY !== undefined ? resolvedElevation.offsetY : 0
    shadowBlur: resolvedElevation && resolvedElevation.blur !== undefined ? resolvedElevation.blur : 0

    Behavior on shadowHorizontalOffset {
        enabled: root.animated
        NumberAnimation {
            duration: root.active ? MotionTokens.durationFast : MotionTokens.durationNormal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: root.active ? MotionTokens.easeSnap : MotionTokens.easeRelease
        }
    }

    Behavior on shadowVerticalOffset {
        enabled: root.animated
        NumberAnimation {
            duration: root.active ? MotionTokens.durationFast : MotionTokens.durationNormal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: root.active ? MotionTokens.easeSnap : MotionTokens.easeRelease
        }
    }
}
