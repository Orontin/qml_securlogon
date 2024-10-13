import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import "../button"
import "../text"
import "../view"
import "../listview"
import "../table"
import "../popup"
import "../radio"
import "../textinput"
import "../searchfile"

ComboBoxCustom {
    property var model: null

    popup_: popupList
    text_: "По ПИН-коду и паролю"

    id: root

    Popup {
        id: popupList

        x: 0
        y: root.height
        width: root.width
        height: root.parentSize.height * 0.3

        modal: true
        focus: true

        background: Rectangle {
            id: backgroundPopup
            color: "#4F4F4F"
            radius: root.parentSize.height * 0.01 < root.parentSize.width * 0.01 ? root.parentSize.height * 0.01 : root.parentSize.width * 0.01

            border.width: root.parentSize.height * 0.002 > root.parentSize.width * 0.002 ? root.parentSize.height * 0.002 : root.parentSize.width * 0.002
            border.color: "#D7D7D7"
        }

        Rectangle {
            id: backgroundContent

            color: "#4F4F4F"
            anchors.fill: parent

            ListViewButton {
                parentSize: root.parentSize
                dataModel: root.model

                backRectangle: backgroundContent

                onSetText: (setText_) => {
                    root.text_ = setText_
                    popupList.close()
                }
            }
        }
    }
}
