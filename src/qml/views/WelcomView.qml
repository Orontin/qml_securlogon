import QtQuick
import QtQuick.Controls

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/combobox"

ViewCustom {
    id: root
    signal exit()
    signal next()

    TextHeader {
        id: header
        text: "Вас приветствует мастер настройки двухфакторной аутентификации"
        parentSize: root
    }

    TextMedium {
        text: "Эта программа позволяет выполнить настройку двухфакторной аутентификации с использованием электронных ключей JaCarta для локальных или доменных пользователей в инфраструктуре на базе ОС семейства Linux"

        anchors.top: header.bottom
        anchors.right: root.right
        anchors.left: root.left
        anchors.topMargin: root.height * 0.02
        anchors.rightMargin: root.width * 0.02
        anchors.leftMargin: root.width * 0.02
    }

    TextSmall {
        text: "Перед началом работы выберите язык системы, и нажмите кнопку «Далее»"

        width: root.width * 0.40

        anchors.bottom: buttonTextLeft.top
        anchors.left: root.left
        anchors.bottomMargin: root.height * 0.02
        anchors.leftMargin: root.width * 0.02
    }

    ButtonTextLeft {
        id: buttonTextLeft
        text_: "Выход"

        parentSize: root

        onClicked: {
            exit()
        }
    }

    ButtonTextRight {
        text_: "Вперед"

        parentSize: root

        onClicked: {
            next()
        }
    }
}
