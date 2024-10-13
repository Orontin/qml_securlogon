import QtQuick
import QtQuick.Controls

import "../components/button"
import "../components/text"
import "../components/view"
import "../popups"

ViewCustom {
    id: root
    signal next()
    signal back()

    TextHeader {
        text: "Настройка удлаенного рабочего стола без использования PKI"
        parentSize: root
    }

    ButtonText {
        id: checkSettings
        text_: "Начальные проверки"

        parentSize: root

        anchors.left: buttonTextLeft.right
        anchors.bottom: root.bottom
        anchors.leftMargin: parentSize.width * 0.02
        anchors.bottomMargin: parentSize.height * 0.02

        onClicked: {
            preCheckSettingsWindow.open()
        }
    }

    PreCheckSettingsWindow {
        id: preCheckSettingsWindow

        parentSize: root

        onOk: {
            preCheckSettingsWindow.close()
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
            postCheckSettingsWindow.open()
        }
    }

    PostCheckSettingsWindow {
        id: postCheckSettingsWindow

        parentSize: root

        onOk: {
            postCheckSettingsWindow.close()
            next()
        }
    }
}
