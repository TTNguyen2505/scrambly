import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Scrambly.DesignSystem

Item {
    id: root
    implicitWidth: 640
    implicitHeight: scrollView.implicitHeight

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentWidth: layout.width
        contentHeight: layout.height
        clip: true

        ColumnLayout {
            id: layout
            width: root.width
            spacing: 12

            AppText {
                text: "Typography Scale Showcase"
                textStyle: TextStyles.headingLG
                color: SemanticColors.textPrimary
            }

            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: SemanticColors.borderDefault
            }

            AppText {
                text: "Display Hero (44px Bold)"
                textStyle: TextStyles.displayHero
            }

            AppText {
                text: "Heading XL (36px Bold)"
                textStyle: TextStyles.headingXL
            }

            AppText {
                text: "Heading LG (24px Bold)"
                textStyle: TextStyles.headingLG
            }

            AppText {
                text: "Heading MD (18px Bold)"
                textStyle: TextStyles.headingMD
            }

            AppText {
                text: "Heading SM (16px Bold)"
                textStyle: TextStyles.headingSM
            }

            AppText {
                text: "Subheading LG (24px Medium)"
                textStyle: TextStyles.subheadingLG
            }

            AppText {
                text: "Subheading MD (18px Medium)"
                textStyle: TextStyles.subheadingMD
            }

            AppText {
                text: "Body Default (14px Regular) - The quick brown fox jumps over the lazy dog."
                textStyle: TextStyles.bodyDefault
            }

            AppText {
                text: "Body Default Medium (14px Medium) - The quick brown fox jumps over the lazy dog."
                textStyle: TextStyles.bodyDefaultMedium
            }

            AppText {
                text: "Body SM (11px Medium) - Small secondary body text."
                textStyle: TextStyles.bodySM
            }

            AppText {
                text: "Button Default (14px Bold)"
                textStyle: TextStyles.buttonDefault
            }

            AppText {
                text: "Button SM (11px Bold)"
                textStyle: TextStyles.buttonSM
            }

            AppText {
                text: "Mono Data: score = 99999, level = 12, time = 02:45"
                textStyle: TextStyles.monoData
            }

            AppText {
                text: "Mono Badge (11px Uppercase Tracking)"
                textStyle: TextStyles.monoBadge
            }

            AppText {
                text: "Mono Shortcut (10px Tracking): CTRL + S"
                textStyle: TextStyles.monoShortcut
            }
        }
    }
}
