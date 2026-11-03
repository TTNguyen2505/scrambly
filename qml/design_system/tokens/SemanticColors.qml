pragma Singleton
import QtQuick

QtObject {
    readonly property color surfacePanel: PrimitiveColors.white
    readonly property color surfaceCanvas: PrimitiveColors.gray100
    readonly property color surfacePrimaryCta: PrimitiveColors.accentVibrant
    readonly property color surfacePrimarySubtle: PrimitiveColors.accentPastel
    readonly property color surfaceInverse: PrimitiveColors.black
    readonly property color surfaceDisabled: PrimitiveColors.gray200

    readonly property color surfaceFeedbackSuccess: PrimitiveColors.greenVibrant
    readonly property color surfaceFeedbackSuccessSubtle: PrimitiveColors.greenPastel
    readonly property color surfaceFeedbackWarning: PrimitiveColors.orangeVibrant
    readonly property color surfaceFeedbackWarningSubtle: PrimitiveColors.orangePastel
    readonly property color surfaceFeedbackDanger: PrimitiveColors.redVibrant
    readonly property color surfaceFeedbackDangerSubtle: PrimitiveColors.redPastel
    readonly property color surfaceFeedbackHighlightSubtle: PrimitiveColors.pinkPastel
    readonly property color surfaceFeedbackHighlight: PrimitiveColors.pinkVibrant

    readonly property color textPrimary: PrimitiveColors.black
    readonly property color textMuted: PrimitiveColors.gray600
    readonly property color textDisabled: PrimitiveColors.gray600
    readonly property color textInverse: PrimitiveColors.white

    readonly property color borderDefault: PrimitiveColors.black
    readonly property color borderDisabled: PrimitiveColors.gray400
    readonly property color borderInverse: PrimitiveColors.white
}
