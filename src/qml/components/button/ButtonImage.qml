import QtQuick
import QtQuick.Controls

import "../text"

AbstractButton {
    id: root

    property var parentSize: null
    property string imagePath: ""

    Rectangle {
        id: rectangleDelegate

        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        color: root.pressed ? "#E74117" : "#353436"

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: root.hovered ? "#E74117" : "#D7D7D7"

        anchors.fill: root

        Image  {
            id: image

            source: imagePath

            fillMode: Image.Pad

            anchors.fill: rectangleDelegate
            anchors.centerIn: rectangleDelegate
        }
    }
}
