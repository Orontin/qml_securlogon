import QtQuick
import QtQuick.Controls

import "../text"

AbstractButton {
    property string text_: ""
    property var parentSize: null

    id: root

    width: parentSize.width * 0.16
    height: parentSize.height * 0.075

    Rectangle {
        id: rectangle
        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        color: !root.enabled ? "#D7D7D7" : root.pressed ? "#E74117" : "#353436"

        anchors.fill: root

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: !root.enabled ? "#D7D7D7" : root.hovered ? "#E74117" : "#D7D7D7"

        TextMedium {
            text: text_

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: !rectangle.enabled ? "#353436" : "#D7D7D7"

            font.bold: true

            anchors.fill: rectangle
        }
    }
}
