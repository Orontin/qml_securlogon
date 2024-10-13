import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/radio"

ViewCustom {
    id: root
    signal netTwoFactorAuthentification()
    signal localTwoFactorAuthentification()
    signal back()
    
    TextHeader {
        id: header
        text: "Выбор настройки двухфакторной аутентификации"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: netTwoFactorAuthentificationRadio
            handleText: "Сетевая двухфакторная аутентификация"
            bodyText: "Аутентификация настраивается для доменных пользователей"

            parentSize: radioColumn.parentSize

            checked: true
        }
        RadioButtonCustom {
            id: localTwoFactorAuthentificationRadio
            handleText: "Локальная двухфакторная аутентификация"
            bodyText: "Аутентификация настраивается для локальных пользователей"

            parentSize: radioColumn.parentSize
        }
    }

    ButtonTextLeft {
        id: buttonTextLeft
        text_: "Назад"

        parentSize: root

        onClicked: {
            back()
        }
    }

    ButtonTextRight {
        text_: "Вперед"

        parentSize: root

        onClicked: {
            if (netTwoFactorAuthentificationRadio.checked) {
                netTwoFactorAuthentification()
            } else if (localTwoFactorAuthentificationRadio.checked) {
                localTwoFactorAuthentification()
            }
        }
    }
}
