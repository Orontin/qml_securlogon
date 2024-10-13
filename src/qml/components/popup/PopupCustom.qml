import QtQuick
import QtQuick.Controls

Popup {
    property var parentSize: null

    id: root

    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape & Popup.CloseOnPressOutsideParent

    background: Rectangle {
        color: "#4F4F4F"
        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
        border.color: "#D7D7D7"
    }
}
