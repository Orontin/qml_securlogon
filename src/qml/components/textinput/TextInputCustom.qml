import QtQuick
import QtQuick.Controls

import "../../common"
import "../text"

Rectangle {
    id: root

    signal startLength()
    signal finishLength()
    signal changeFocus()

    property var parentSize: null
    property string headerText: ""
    property string backgroundText: ""
    property int maximumLength: 2147483647
    property int alignHorizontal: Text.AlignLeft

    color: "transparent"

    AbstractButton {
        id: button

        anchors.fill: root

        Rectangle {
            id: backgroundHeaderText
            color: "#353436"

            width: textHeader.width * 1.1
            height: textHeader.height * 1.1

            border.width: root.parentSize.height * 0.002 > root.parentSize.width * 0.002 ? root.parentSize.height * 0.002 : root.parentSize.width * 0.002
            border.color: inputLine.activeFocus || button.hovered ? "#E74117" : "#D7D7D7"

            anchors.bottom: button.top
            anchors.left: button.left

            anchors.bottomMargin: -border.width
            anchors.leftMargin: button.width * 0.025

            TextSmall {
                id: textHeader
                text: headerText

                color: "#D7D7D7"

                anchors.centerIn: backgroundHeaderText
            }
        }

        Rectangle {
            id: background
            radius: root.parentSize.height * 0.01 < root.parentSize.width * 0.01 ? root.parentSize.height * 0.01 : root.parentSize.width * 0.01

            color: root.enabled ? "#353436" : "#D7D7D7"

            anchors.fill: button

            border.width: root.parentSize.height * 0.002 > root.parentSize.width * 0.002 ? root.parentSize.height * 0.002 : root.parentSize.width * 0.002
            border.color: inputLine.activeFocus || button.hovered ? "#E74117" : "#D7D7D7"

            TextMedium {
                text: backgroundText
                visible: inputLine.length === 0

                horizontalAlignment: alignHorizontal
                verticalAlignment: Text.AlignVCenter

                anchors.fill: background

                anchors.leftMargin: root.parentSize.width * 0.01
                anchors.rightMargin: root.parentSize.width * 0.01
            }
        }

        TextInput {
            id: inputLine

            maximumLength: root.maximumLength

            color: root.enabled ? "#D7D7D7" : "#4F4F4F"

            horizontalAlignment: alignHorizontal
            verticalAlignment: Text.AlignVCenter

            clip: true

            selectByMouse: true

            anchors.fill: button

            anchors.leftMargin: root.parentSize.width * 0.01
            anchors.rightMargin: root.parentSize.width * 0.01

            font.pointSize: Common.__height__ * 0.02 < Common.__width__ * 0.02 ? Common.__height__ * 0.02 : Common.__width__ * 0.02

            onTextChanged: {
                if (inputLine.length === inputLine.maximumLength) {
                    finishLength()
                } else if (inputLine.length === 0) {
                    startLength()
                }
            }

            onFocusChanged: {
                root.changeFocus()
            }
        }
    }

    function setFocus() {
        inputLine.focus = true
    }

    function setText(text) {
        inputLine.text = text
    }
}
