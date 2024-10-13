import QtQuick
import QtQuick.Controls

ScrollBar {
    property var topItem: null
    property var parentSize: null

    id: root

    active: true

    background: Rectangle {
        id: backgroundScrollBar
        implicitWidth: parentSize.height * 0.01 > parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01
        implicitHeight: topItem.height
        color: "#D7D7D7"

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: "#D7D7D7"
    }

    contentItem: Rectangle {
        implicitWidth: topItem.width * 0.01
        implicitHeight: topItem.height * 0.01
        color: root.pressed || root.hovered ? "#E74117" : "#353436"
    }
}
