import QtQuick
import QtQuick.Controls

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/flickable"

ViewCustom {
    id: root
    signal back()
    signal next()

    TextHeader {
        id: header
        text: "Лицензионное соглашение"
        parentSize: root
    }

    FlickableCustom {
        id: scrollView

        parentSize: root

        flickableDirection: Flickable.VerticalFlick

        anchors.left: root.left
        anchors.right: root.right
        anchors.top: header.bottom
        anchors.bottom: checkBox.top

        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.02
        anchors.bottomMargin: root.height * 0.02

        onAtYEndChanged: {
            checkBox.enabled = true
        }
    }

    ButtonCheckBoxText {
        id: checkBox
        text_: "Я прочитал лицензионное соглашение и принимаю его."

        parentSize: root

        enabled: false

        anchors.left: root.left
        anchors.bottom: buttonLeft.top

        anchors.leftMargin: root.width * 0.02
        anchors.bottomMargin: root.height * 0.02
    }

    ButtonTextLeft {
        id: buttonLeft
        text_: "Назад"

        parentSize: root

        onClicked: {
            back()
        }
    }

    ButtonTextRight {
        id: buttonRight
        text_: "Вперед"

        parentSize: root

        enabled: checkBox.checked

        onClicked: {
            next()
        }
    }
}
