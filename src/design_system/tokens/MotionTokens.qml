pragma Singleton
import QtQuick

QtObject {
    readonly property int durationInstant: 80
    readonly property int durationFast: 120
    readonly property int durationNormal: 180
    readonly property int durationDeliberate: 240

    readonly property var easeSnap: [0.0, 0.0, 0.2, 1.0, 1.0, 1.0]
    readonly property var easeRelease: [0.25, 1.0, 0.5, 1.0, 1.0, 1.0]
    readonly property var easePop: [0.34, 1.56, 0.64, 1.0, 1.0, 1.0]
}
