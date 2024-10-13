import QtQuick
import QtQuick.Controls

import "../text"

AbstractButton {
    property string text_: ""
    property var parentSize: null

    id: root

    height: background.height
    width: background.width

    Rectangle {
        id: indicator

        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        color: !root.enabled ? "#D7D7D7" : root.pressed || root.checked ? "#E74117" : "#353436"

        width: root.parentSize.height * 0.04 < root.parentSize.width * 0.04 ? root.parentSize.height * 0.04 : root.parentSize.width * 0.04
        height: width

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: root.enabled && (root.hovered || root.checked) ? "#E74117" : "#D7D7D7"

        TextMedium {
            text: "V"

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: "#353436"

            anchors.centerIn: indicator
        }
    }

    TextMedium {
        id: textMessage

        text: text_

        verticalAlignment: Text.AlignVCenter

        color: "#D7D7D7"

        anchors.left: indicator.right
        anchors.leftMargin: root.parentSize.width * 0.01
    }

    Rectangle {
        id: background
        color: "transparent"

        anchors.left: indicator.left
        anchors.right: textMessage.right
        anchors.top: indicator.top
        anchors.bottom: indicator.bottom
    }

    onClicked: {
        checked = !checked
    }
}
