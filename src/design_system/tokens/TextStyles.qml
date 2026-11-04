pragma Singleton
import QtQuick

QtObject {
    id: root

    component TextStyle: QtObject {
        property string family: PrimitiveTypography.fontFamilyPrimary
        property real pixelSize: PrimitiveTypography.size14
        property int weight: PrimitiveTypography.weightRegular
        property real lineHeight: PrimitiveTypography.lineHeight20
        property real letterSpacingPercent: PrimitiveTypography.letterSpacingNormal
        property int capitalization: Font.MixedCase
        property color color: SemanticColors.textPrimary

        readonly property real resolvedLetterSpacing: (letterSpacingPercent / 100.0) * pixelSize
    }

    readonly property TextStyle displayHero: TextStyle {
        pixelSize: PrimitiveTypography.size44
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight50
    }

    readonly property TextStyle subtitleDefault: TextStyle {
        pixelSize: PrimitiveTypography.size16
        lineHeight: PrimitiveTypography.lineHeight24
    }

    readonly property TextStyle headingXL: TextStyle {
        pixelSize: PrimitiveTypography.size36
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight40
        letterSpacingPercent: -2
    }

    readonly property TextStyle headingLG: TextStyle {
        pixelSize: PrimitiveTypography.size24
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight30
        letterSpacingPercent: -2
    }

    readonly property TextStyle headingMD: TextStyle {
        pixelSize: PrimitiveTypography.size18
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight24
    }

    readonly property TextStyle headingSM: TextStyle {
        pixelSize: PrimitiveTypography.size16
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight22
    }

    readonly property TextStyle subheadingLG: TextStyle {
        pixelSize: PrimitiveTypography.size24
        weight: PrimitiveTypography.weightMedium
        lineHeight: PrimitiveTypography.lineHeight30
    }

    readonly property TextStyle subheadingMD: TextStyle {
        pixelSize: PrimitiveTypography.size18
        weight: PrimitiveTypography.weightMedium
        lineHeight: PrimitiveTypography.lineHeight24
    }

    readonly property TextStyle buttonDefault: TextStyle {
        pixelSize: PrimitiveTypography.size14
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight18
    }

    readonly property TextStyle buttonSM: TextStyle {
        pixelSize: PrimitiveTypography.size11
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight14
    }

    readonly property TextStyle bodySM: TextStyle {
        pixelSize: PrimitiveTypography.size11
        weight: PrimitiveTypography.weightMedium
        lineHeight: PrimitiveTypography.lineHeight16
    }

    readonly property TextStyle bodyDefault: TextStyle {
        pixelSize: PrimitiveTypography.size14
        weight: PrimitiveTypography.weightRegular
        lineHeight: PrimitiveTypography.lineHeight20
    }

    readonly property TextStyle bodyDefaultMedium: TextStyle {
        pixelSize: PrimitiveTypography.size14
        weight: PrimitiveTypography.weightMedium
        lineHeight: PrimitiveTypography.lineHeight20
    }

    readonly property TextStyle monoData: TextStyle {
        family: PrimitiveTypography.fontFamilyMono
        pixelSize: PrimitiveTypography.size14
        lineHeight: PrimitiveTypography.lineHeight20
    }

    readonly property TextStyle monoBadge: TextStyle {
        family: PrimitiveTypography.fontFamilyMono
        pixelSize: PrimitiveTypography.size11
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight14
        letterSpacingPercent: 5
        capitalization: Font.AllUppercase
    }

    readonly property TextStyle monoShortcut: TextStyle {
        family: PrimitiveTypography.fontFamilyMono
        pixelSize: PrimitiveTypography.size10
        weight: PrimitiveTypography.weightBold
        lineHeight: PrimitiveTypography.lineHeight14
        letterSpacingPercent: 5
    }
}
