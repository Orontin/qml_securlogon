import QtQuick
import QtQuick.Controls

import "../text"

AbstractButton {
    id: root

    property bool isCurrent: false
    property var parentSize: null

    Rectangle {
        id: rectangleDelegate

        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        color: isCurrent || root.pressed ? "#E74117" : "#353436"

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: isCurrent || root.hovered ? "#E74117" : "#D7D7D7"

        anchors.fill: root

        anchors.topMargin: parentSize.height * 0.02
        anchors.bottomMargin: parentSize.height * 0.02
        anchors.leftMargin: parentSize.width * 0.02
        anchors.rightMargin: parentSize.width * 0.02

        Image  {
            id: image

            source: model.image

            fillMode: Image.PreserveAspectFit

            anchors.top: rectangleDelegate.top
            anchors.bottom: rectangleDelegate.bottom
            anchors.left: rectangleDelegate.left
            anchors.right: rectangleDelegate.right

            anchors.bottomMargin: rectangleDelegate.height * 0.30
        }

        TextMedium {
            id: textMedium
            text: model.text

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            anchors.top: image.bottom
            anchors.bottom: rectangleDelegate.bottom
            anchors.right: rectangleDelegate.right
            anchors.left: rectangleDelegate.left
        }
    }
}
