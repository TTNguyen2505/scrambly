pragma Singleton
import QtQuick

QtObject {
    id: root

    component ElevationStyle: QtObject {
        property bool enabled: true
        property real offsetX: 0
        property real offsetY: 0
        property real blur: PrimitiveDepth.depth0
        property real spread: PrimitiveDepth.depth0
        property color color: PrimitiveColors.black
    }

    readonly property ElevationStyle elevationDepth0: ElevationStyle {
        enabled: false
    }

    readonly property ElevationStyle elevationDepth50: ElevationStyle {
        offsetX: PrimitiveDepth.depth50
        offsetY: PrimitiveDepth.depth50
    }

    readonly property ElevationStyle elevationDepth100: ElevationStyle {
        offsetX: PrimitiveDepth.depth100
        offsetY: PrimitiveDepth.depth100
    }

    readonly property ElevationStyle elevationDepth200: ElevationStyle {
        offsetX: PrimitiveDepth.depth200
        offsetY: PrimitiveDepth.depth200
    }

    readonly property ElevationStyle elevationDepth300: ElevationStyle {
        offsetX: PrimitiveDepth.depth300
        offsetY: PrimitiveDepth.depth300
    }

    readonly property ElevationStyle elevationDepth400: ElevationStyle {
        offsetX: PrimitiveDepth.depth400
        offsetY: PrimitiveDepth.depth400
    }
}

