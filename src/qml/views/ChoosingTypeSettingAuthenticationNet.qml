import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/radio"

ViewCustom {
    id: root
    signal netTwoFactorAuthentificationPKI()
    signal netTwoFactorAuthentificationNoPKI()
    signal netTwoFactorAuthentificationOTP()
    signal back()

    TextHeader {
        id: header
        text: "Выбор настройки сетевой двухфакторной аутентификации"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: netTwoFactorAuthentificationPKIRadio
            handleText: "Сетевая двухфакторная аутентификация c использованием PKI"
            bodyText: "Аутентификация настраивается для доменных пользователей c использованием PKI"

            parentSize: radioColumn.parentSize

            checked: true
        }
        RadioButtonCustom {
            id: netTwoFactorAuthentificationNoPKIRadio
            handleText: "Сетевая двухфакторная аутентификация без использования PKI"
            bodyText: "Аутентификация настраивается для доменных пользователей c использованием профилей"

            parentSize: radioColumn.parentSize
        }
        RadioButtonCustom {
            id: netTwoFactorAuthentificationOTPRadio
            handleText: "Сетевая двухфакторная аутентификация с использованием OTP"
            bodyText: "Аутентификация настраивается для доменных пользователей с использованием OTP"

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
            if (netTwoFactorAuthentificationPKIRadio.checked) {
                netTwoFactorAuthentificationPKI()
            } else if (netTwoFactorAuthentificationNoPKIRadio.checked) {
                netTwoFactorAuthentificationNoPKI()
            } else if (netTwoFactorAuthentificationOTPRadio.checked) {
                netTwoFactorAuthentificationOTP()
            }
        }
    }
}
