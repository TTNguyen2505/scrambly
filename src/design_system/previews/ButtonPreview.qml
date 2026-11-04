import QtQuick
import QtQuick.Layouts
import Scrambly
import Scrambly.DesignSystem

Item {
    id: root
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    ColumnLayout {
        id: layout
        anchors.centerIn: parent
        spacing: SemanticSizes.spaceLg

        AppText {
            Layout.alignment: Qt.AlignHCenter
            text: Strings.appName + " - " + Strings.buttonShowcaseTitle
            textStyle: TextStyles.headingLG
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: SemanticSizes.spaceMd

            Button {
                label: Strings.playGame
                variant: "Primary"
                leadingIconSource: "qrc:/assets/images/icons/ic_play.svg"
                showTrailingIcon: false
                onClicked: console.log("Primary Play clicked")
            }

            Button {
                label: Strings.settings
                variant: "Secondary"
                leadingIconSource: "qrc:/assets/images/icons/ic_settings.svg"
                showTrailingIcon: false
                onClicked: console.log("Secondary Settings clicked")
            }

            Button {
                label: Strings.leaderboard
                variant: "Inverse"
                leadingIconSource: "qrc:/assets/images/icons/ic_trophy.svg"
                showTrailingIcon: false
                onClicked: console.log("Inverse Leaderboard clicked")
            }

            Button {
                label: Strings.quit
                variant: "Destructive"
                leadingIconSource: "qrc:/assets/images/icons/ic_exit.svg"
                showTrailingIcon: false
                onClicked: console.log("Destructive Quit clicked")
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: SemanticSizes.spaceMd

            Button {
                size: "Small"
                label: Strings.quickPlay
                variant: "Primary"
                leadingIconSource: "qrc:/assets/images/icons/ic_bolt.svg"
                showTrailingIcon: false
            }

            Button {
                size: "Small"
                label: Strings.help
                variant: "Secondary"
                leadingIconSource: "qrc:/assets/images/icons/ic_help.svg"
                showTrailingIcon: false
            }

            Button {
                size: "Small"
                label: Strings.next
                variant: "Secondary"
                showLeadingIcon: false
                trailingIconSource: "qrc:/assets/images/icons/ic_arrow_forward.svg"
                showTrailingIcon: true
            }

            Button {
                size: "Small"
                label: Strings.disabled
                variant: "Primary"
                leadingIconSource: "qrc:/assets/images/icons/ic_lock.svg"
                showTrailingIcon: false
                enabled: false
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: SemanticSizes.spaceMd

            Button {
                label: Strings.textOnlyNoIcon
                variant: "Secondary"
                showLeadingIcon: false
                showTrailingIcon: false
            }

            Button {
                label: Strings.dualIcons
                variant: "Primary"
                leadingIconSource: "qrc:/assets/images/icons/ic_crown.svg"
                trailingIconSource: "qrc:/assets/images/icons/ic_check.svg"
                showLeadingIcon: true
                showTrailingIcon: true
            }

            Button {
                label: Strings.customSizedIcon
                variant: "Secondary"
                leadingIconSource: "qrc:/assets/images/icons/ic_account.svg"
                showTrailingIcon: false
                iconSize: 24
                iconTextSpacing: 12
            }
        }
    }
}
