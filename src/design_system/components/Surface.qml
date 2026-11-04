import QtQuick
import Scrambly.DesignSystem

Rectangle {
    id: root

    property var elevation: EffectStyles.elevationDepth0
    property bool animated: false
    property bool active: false

    color: SemanticColors.surfacePanel
    border.color: SemanticColors.borderDefault
    border.width: SemanticBorderWidth.defaultWidth
    radius: 0

    layer.enabled: animated || (elevation && elevation.enabled !== false) || (typeof elevation === "string" && elevation !== "elevationDepth0" && elevation !== "0")
    layer.effect: ElevationEffect {
        elevation: root.elevation
        animated: root.animated
        active: root.active
    }
}
