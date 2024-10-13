import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/radio"

ViewCustom {
    id: root
    signal remoteRDPTwoFactorAuthentificationPKI()
    signal remoteRDPTwoFactorAuthentificationNoPKI()
    signal back()

    TextHeader {
        id: header
        text: "Выбор настройки удаленного рабочего стола с двухфакторной аутентификацией"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: remoteRDPTwoFactorAuthentificationPKIRadio
            handleText: "Удаленный рабочий стол с двухфакторной аутентификацией по PKI"
            bodyText: "Удаленный рабочий стол настраивается для доменных пользователей c использованием PKI"

            parentSize: radioColumn.parentSize

            checked: true
        }
        RadioButtonCustom {
            id: remoteRDPTwoFactorAuthentificationNoPKIRadio
            handleText: "Удаленный рабочий стол с двухфакторной аутентификацией без PKI"
            bodyText: "Удаленный рабочий стол настраивается для доменных пользователей c использованием профилей"

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
            if (remoteRDPTwoFactorAuthentificationPKIRadio.checked) {
                remoteRDPTwoFactorAuthentificationPKI()
            } else if (remoteRDPTwoFactorAuthentificationNoPKIRadio.checked) {
                remoteRDPTwoFactorAuthentificationNoPKI()
            }
        }
    }
}
