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
import "../components/listview"
import "../components/inputoldkey"

PopupCustomWindowBig {
    signal ok()

    id: root

    Rectangle {
        id: rectangle
        color: "#4F4F4F"

        anchors.fill: parent

        TextHeader {
            id: header
            text: "Проверка настройка ОС перед внесением изменений SL"
            parentSize: rectangle
        }

        ButtonTextRight {
            text_: "Закрыть"

            anchorsRight: rectangle.right
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
                ok()
            }
        }
    }
}
