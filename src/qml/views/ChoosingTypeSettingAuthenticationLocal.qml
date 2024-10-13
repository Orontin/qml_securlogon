import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/radio"

ViewCustom {
    id: root
    signal localTwoFactorAuthentificationNoPKI()
    signal back()

    TextHeader {
        id: header
        text: "Выбор настройки локальной двухфакторной аутентификации"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: localTwoFactorAuthentificationNoPKIRadio
            handleText: "Локальная двухфакторная аутентификация без использования PKI"
            bodyText: "Аутентификация настраивается для локальных пользователей без использования PKI, используются профили"

            parentSize: radioColumn.parentSize

            checked: true
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
            if (localTwoFactorAuthentificationNoPKIRadio.checked) {
                localTwoFactorAuthentificationNoPKI()
            }
        }
    }
}
