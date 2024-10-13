import QtQuick

import "../components/button"
import "../components/text"
import "../components/textinput"
import "../components/view"
import "../components/table"
import "../components/popup"
import "../components/radio"
import "../components/searchfile"
import "../components/other"
import "../components/inputoldkey"

PopupCustomDialogHeader {
    signal yes()
    signal no()
    id: root

    Rectangle {
        id: rectangle
        color: "#4F4F4F"

        anchors.fill: parent

        TextHeader {
            text: "Установить дополнительно OTP аутентификацию?"
            parentSize: rectangle
        }

        ButtonTextLeft {
            id: buttonTextLeft
            text_: "Да"

            anchorsLeft: rectangle.left
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
                yes()
            }
        }

        ButtonTextRight {
            text_: "Нет"

            anchorsRight: rectangle.right
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
                no()
            }
        }
    }
}
