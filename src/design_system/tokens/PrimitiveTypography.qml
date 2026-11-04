pragma Singleton
import QtQuick

QtObject {
    id: root

    readonly property FontLoader fontSpaceGroteskRegular: FontLoader {
        source: "qrc:/assets/fonts/space_grotesk_regular.ttf"
    }

    readonly property FontLoader fontSpaceGroteskMedium: FontLoader {
        source: "qrc:/assets/fonts/space_grotesk_medium.ttf"
    }

    readonly property FontLoader fontSpaceGroteskBold: FontLoader {
        source: "qrc:/assets/fonts/space_grotesk_bold.ttf"
    }

    readonly property FontLoader fontSpaceMonoRegular: FontLoader {
        source: "qrc:/assets/fonts/space_mono_regular.ttf"
    }

    readonly property FontLoader fontSpaceMonoBold: FontLoader {
        source: "qrc:/assets/fonts/space_mono_bold.ttf"
    }

    readonly property string fontFamilyPrimary: fontSpaceGroteskRegular.name ? fontSpaceGroteskRegular.name : "Space Grotesk"
    readonly property string fontFamilyMono: fontSpaceMonoRegular.name ? fontSpaceMonoRegular.name : "Space Mono"

    readonly property real weightRegular: 400
    readonly property real weightMedium: 500
    readonly property real weightBold: 700

    readonly property real size10: 10
    readonly property real size11: 11
    readonly property real size14: 14
    readonly property real size16: 16
    readonly property real size18: 18
    readonly property real size24: 24
    readonly property real size32: 32
    readonly property real size36: 36
    readonly property real size44: 44

    readonly property real lineHeight14: 14
    readonly property real lineHeight16: 16
    readonly property real lineHeight18: 18
    readonly property real lineHeight20: 20
    readonly property real lineHeight22: 22
    readonly property real lineHeight24: 24
    readonly property real lineHeight30: 30
    readonly property real lineHeight40: 40
    readonly property real lineHeight50: 50

    readonly property real letterSpacingTight: -2
    readonly property real letterSpacingNormal: 0
    readonly property real letterSpacingWide: 5
}
