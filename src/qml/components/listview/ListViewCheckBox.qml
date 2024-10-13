import QtQuick
import QtQuick.Controls

import "../button"

Rectangle {
    id: root

    property var parentSize: null
    property var dataModel: null

    property var backRectangle: null

    color: "#353436"

    radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

    border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
    border.color: root.enabled && (root.hovered || root.checked) ? "#E74117" : "#D7D7D7"

    anchors.top: backRectangle.top
    anchors.bottom: backRectangle.bottom
    anchors.left: backRectangle.left
    anchors.right: backRectangle.right

    ListView {
        id: listView

        clip: true

        model: root.dataModel

        anchors.fill: root

        anchors.topMargin: parentSize.height * 0.02
        anchors.bottomMargin: parentSize.height * 0.02
        anchors.leftMargin: parentSize.width * 0.02
        anchors.rightMargin: parentSize.width * 0.02

        delegate: Rectangle {
            color: "transparent"

            width: listView.width
            height: checkBox.height * 1.1

            ButtonCheckBoxText {
                id: checkBox
                parentSize: root.parentSize
                text_: model.text

                checked: true

                onClicked: {
                    listView.currentIndex = model.index
                }
            }
        }
    }
}

