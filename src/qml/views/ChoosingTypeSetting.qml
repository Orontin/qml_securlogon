import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/radio"

ViewCustom {
    id: root
    signal twoFactorAuthentidication()
    signal remoteDesktopProtocol()
    signal workProfiles()
    signal additionalSettings()
    signal licenseSettings()
    signal back()

    TextHeader {
        id: header
        text: "Выбор настройки"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: twoFactorAuthentidicationRadio
            handleText: "Двухфакторная аутентификация"

            parentSize: radioColumn.parentSize

            checked: true
        }
        RadioButtonCustom {
            id: remoteDesktopProtocolRadio
            handleText: "Удаленный рабочий стол"

            parentSize: radioColumn.parentSize
        }
        RadioButtonCustom {
            id: workProfilesRadio
            handleText: "Работа с профилями"

            parentSize: radioColumn.parentSize
        }
        RadioButtonCustom {
            id: additionalSettingsRadio
            handleText: "Дополнительные настройки"

            parentSize: radioColumn.parentSize
        }
        RadioButtonCustom {
            id: licenseSettingsRadio
            handleText: "Лицензионные настройки"

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
            if (twoFactorAuthentidicationRadio.checked) {
                twoFactorAuthentidication()
            } else if (remoteDesktopProtocolRadio.checked) {
                remoteDesktopProtocol()
            } else if (workProfilesRadio.checked) {
                workProfiles()
            } else if (additionalSettingsRadio.checked) {
                additionalSettings()
            } else if (licenseSettingsRadio.checked) {
                licenseSettings()
            }
        }
    }
}
