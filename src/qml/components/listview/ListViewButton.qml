import QtQuick
import QtQuick.Controls

import "../button"

Rectangle {
    signal setText(setText_ : string)

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
            id: background_
            color: "transparent"

            width: listView.width
            height: listView.height * 0.3333

            ButtonText {
                id: checkBox
                parentSize: root.parentSize
                text_: model.text

                anchors.top: background_.top
                anchors.bottom: background_.bottom
                anchors.left: background_.left
                anchors.right: background_.right

                anchors.topMargin: background_.height * 0.02
                anchors.bottomMargin: background_.height * 0.02
                anchors.leftMargin: background_.width * 0.02
                anchors.rightMargin: background_.width * 0.02

                checked: true

                onClicked: {
                    listView.currentIndex = model.index
                    setText(model.text)
                }
            }
        }
    }
}
