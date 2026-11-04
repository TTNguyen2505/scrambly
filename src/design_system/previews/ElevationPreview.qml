import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Scrambly.DesignSystem

Item {
    id: root
    implicitWidth: 700
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
            spacing: 24

            AppText {
                text: "Elevation & Shadow System Showcase"
                textStyle: TextStyles.headingLG
                color: SemanticColors.textPrimary
            }

            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: SemanticColors.borderDefault
            }

            // Thẻ tương tác động (Interactive Card)
            AppText {
                text: "Interactive Animated Surface (Hover / Press below):"
                textStyle: TextStyles.subheadingMD
            }

            Surface {
                id: interactiveCard
                Layout.preferredWidth: 320
                Layout.preferredHeight: 100
                color: SemanticColors.surfacePanel
                elevation: mouseArea.pressed ? EffectStyles.elevationDepth50 : mouseArea.containsMouse ? EffectStyles.elevationDepth300 : EffectStyles.elevationDepth100
                animated: true
                active: mouseArea.containsMouse || mouseArea.pressed

                transform: Translate {
                    x: mouseArea.pressed ? 1 : mouseArea.containsMouse ? -2 : 0
                    y: mouseArea.pressed ? 1 : mouseArea.containsMouse ? -2 : 0

                    Behavior on x {
                        NumberAnimation {
                            duration: (mouseArea.containsMouse || mouseArea.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                            easing.type: Easing.BezierSpline
                            easing.bezierCurve: (mouseArea.containsMouse || mouseArea.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                        }
                    }

                    Behavior on y {
                        NumberAnimation {
                            duration: (mouseArea.containsMouse || mouseArea.pressed) ? MotionTokens.durationFast : MotionTokens.durationNormal
                            easing.type: Easing.BezierSpline
                            easing.bezierCurve: (mouseArea.containsMouse || mouseArea.pressed) ? MotionTokens.easeSnap : MotionTokens.easeRelease
                        }
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 4

                    AppText {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: mouseArea.pressed ? "State: Pressed (Depth 50)" : mouseArea.containsMouse ? "State: Hovered (Depth 300)" : "State: Default (Depth 100)"
                        textStyle: TextStyles.buttonDefault
                    }

                    AppText {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Smoothly animated with MotionTokens"
                        textStyle: TextStyles.bodySM
                        color: SemanticColors.textSecondary
                    }
                }
            }

            // Toàn bộ các cấp độ Elevation tĩnh
            AppText {
                text: "Static Elevation Depth Levels:"
                textStyle: TextStyles.subheadingMD
            }

            Flow {
                Layout.fillWidth: true
                spacing: 20

                Repeater {
                    model: [
                        {
                            name: "Depth 0 (Disabled / Flat)",
                            level: EffectStyles.elevationDepth0,
                            desc: "0px offset"
                        },
                        {
                            name: "Depth 50 (Pressed / Subtle)",
                            level: EffectStyles.elevationDepth50,
                            desc: "1px offset"
                        },
                        {
                            name: "Depth 100 (Default Resting)",
                            level: EffectStyles.elevationDepth100,
                            desc: "2px offset"
                        },
                        {
                            name: "Depth 200 (Hovered State)",
                            level: EffectStyles.elevationDepth200,
                            desc: "4px offset"
                        },
                        {
                            name: "Depth 300 (Raised / Popover)",
                            level: EffectStyles.elevationDepth300,
                            desc: "8px offset"
                        },
                        {
                            name: "Depth 400 (Modal / Dialog)",
                            level: EffectStyles.elevationDepth400,
                            desc: "16px offset"
                        }
                    ]

                    Surface {
                        width: 200
                        height: 90
                        elevation: modelData.level

                        Column {
                            anchors.centerIn: parent
                            spacing: 4

                            AppText {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: modelData.name
                                textStyle: TextStyles.buttonSM
                            }

                            AppText {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: modelData.desc
                                textStyle: TextStyles.monoBadge
                                color: SemanticColors.textSecondary
                            }
                        }
                    }
                }
            }
        }
    }
}
