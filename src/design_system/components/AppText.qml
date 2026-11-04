import QtQuick
import Scrambly.DesignSystem

Text {
    id: root

    property var textStyle: TextStyles.bodyDefault

    readonly property var resolvedStyle: {
        if (typeof textStyle === "string") {
            return TextStyles[textStyle] || TextStyles.bodyDefault;
        }
        return textStyle || TextStyles.bodyDefault;
    }

    font.family: resolvedStyle && resolvedStyle.family ? resolvedStyle.family : PrimitiveTypography.fontFamilyPrimary
    font.pixelSize: resolvedStyle && resolvedStyle.pixelSize ? resolvedStyle.pixelSize : PrimitiveTypography.size14
    font.weight: resolvedStyle && resolvedStyle.weight ? resolvedStyle.weight : PrimitiveTypography.weightRegular
    font.letterSpacing: resolvedStyle && resolvedStyle.resolvedLetterSpacing !== undefined ? resolvedStyle.resolvedLetterSpacing : PrimitiveTypography.letterSpacingNormal
    font.capitalization: resolvedStyle && resolvedStyle.capitalization !== undefined ? resolvedStyle.capitalization : Font.MixedCase
    lineHeight: resolvedStyle && resolvedStyle.lineHeight ? resolvedStyle.lineHeight : PrimitiveTypography.lineHeight20
    lineHeightMode: Text.FixedHeight
    color: resolvedStyle && resolvedStyle.color ? resolvedStyle.color : SemanticColors.textPrimary
}
