import QtQuick
import QtQuick.Controls

import "../text"
import "../button"
import "../view"
import "../listview"
import "../table"
import "../popup"
import "../radio"
import "../textinput"
import "../searchfile"

Rectangle {
    property var parentSize: null
    property var popup_: null
    property string text_: "По ПИН-коду и паролю"
    property string headerText: ""

    signal clicked()

    id: root

    color: "transparent"

    Rectangle {
        id: borderRectangle

        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        color: "#353436"

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: !enabled ? "#D7D7D7" : button.hovered  || (popup_ !== null && popup_.visible) ? "#E74117" : "#D7D7D7"

        anchors.fill: root

        Rectangle {
            id: backgroundHeaderText
            color: "#353436"

            width: textHeader.width * 1.1
            height: textHeader.height * 1.1

            border.width: root.parentSize.height * 0.002 > root.parentSize.width * 0.002 ? root.parentSize.height * 0.002 : root.parentSize.width * 0.002
            border.color: !enabled ? "#D7D7D7" : button.hovered  || (popup_ !== null && popup_.visible) ? "#E74117" : "#D7D7D7"

            anchors.bottom: borderRectangle.top
            anchors.left: borderRectangle.left

            anchors.bottomMargin: -border.width
            anchors.leftMargin: root.width * 0.025

            TextSmall {
                id: textHeader
                text: headerText

                color: "#D7D7D7"

                anchors.centerIn: backgroundHeaderText
            }
        }

        AbstractButton {
            id: button

            anchors.fill: borderRectangle

            Rectangle {
                id: information
                color: "transparent"

                anchors.top: button.top
                anchors.bottom: button.bottom
                anchors.left: button.left
                anchors.right: button.right

                anchors.rightMargin: button.height

                TextMedium {
                    text: text_

                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter

                    anchors.fill: information

                    anchors.topMargin: information.height * 0.2
                    anchors.bottomMargin: information.height * 0.2
                    anchors.leftMargin: information.height * 0.2
                    anchors.rightMargin: information.height * 0.2
                }
            }

            Rectangle {
                id: indicator
                color: "transparent"

                anchors.top: button.top
                anchors.bottom: button.bottom
                anchors.left: information.right
                anchors.right: button.right

                Rectangle {
                    id: indicatorBorder

                    color: button.pressed || (popup_ !== null && popup_.visible) ? "#E74117" : "transparent"

                    radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

                    anchors.fill: indicator

                    anchors.topMargin: indicator.height * 0.2
                    anchors.bottomMargin: indicator.height * 0.2
                    anchors.leftMargin: indicator.width * 0.2
                    anchors.rightMargin: indicator.width * 0.2

                    border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
                    border.color: !enabled ? "#D7D7D7" : button.hovered || (popup_ !== null && popup_.visible) ? "#E74117" : "#D7D7D7"

                    TextSmall {
                        text: "V"

                        rotation: button.pressed || (popup_ !== null && popup_.visible) ? 0 : 180

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        anchors.fill: indicatorBorder
                    }
                }
            }

            onClicked: {
                popup_.open()
                root.clicked()
            }
        }
    }
}
