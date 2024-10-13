import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../text"

RadioButton {
    property string handleText: ""
    property string bodyText: ""
    property var parentSize: null

    id: root

    height: visible === false ? 0 : rectangle.height + textHandle.height + line.height + textBody.height
    width: visible === false ? 0 : parentSize.width * 0.90

    indicator: Rectangle {
        id: rectangle
        implicitWidth: parentSize.height * 0.04 < parentSize.width * 0.04 ? parentSize.height * 0.04 : parentSize.width * 0.04
        implicitHeight: parentSize.height * 0.04 < parentSize.width * 0.04 ? parentSize.height * 0.04 : parentSize.width * 0.04
        x: 0
        y: 0
        radius: 100

        color: "#353436"

        border.color: parent.checked || parent.hovered ? "#E74117" : "#D7D7D7"

        Rectangle {
            width: parentSize.height * 0.02 < parentSize.width * 0.02 ? parentSize.height * 0.02 : parentSize.width * 0.02
            height: parentSize.height * 0.02 < parentSize.width * 0.02 ? parentSize.height * 0.02 : parentSize.width * 0.02
            x: rectangle.width / 2 - width / 2
            y: rectangle.height / 2 - height / 2
            radius: 100
            color: "#E74117"
            visible: root.checked
        }
    }

    TextMedium {
        id: textHandle
        text: root.handleText

        width: parentSize.width * 0.80

        font.bold: true

        anchors.left: rectangle.right
        anchors.leftMargin: rectangle.implicitHeight
    }

    Rectangle {
        id: line
        width: parentSize.width * 0.80
        height: parentSize.height * 0.004

        color: root.checked || root.hovered ? "#E74117" : "#D7D7D7"

        anchors.top: textHandle.bottom
        anchors.left: rectangle.left
        anchors.topMargin: parentSize.height * 0.01
        anchors.leftMargin: rectangle.implicitHeight
    }

    TextSmall {
        id: textBody
        text: root.bodyText

        width: root.bodyText !== "" ? parentSize.width * 0.9 : 0
        height: root.bodyText !== "" ? text.height : 0

        anchors.left: rectangle.left
        anchors.top: line.bottom
    }

    contentItem: Rectangle {
        height: root.height
        width: root.width
        color: "transparent"
    }
}
