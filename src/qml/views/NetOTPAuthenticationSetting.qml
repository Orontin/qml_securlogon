import QtQuick
import QtQuick.Controls

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/textinput"
import "../components/combobox"
import "../popups"

ViewCustom {
    id: root
    signal next()
    signal back()

    TextHeader {
        id: header
        text: "Настройка сетевой дфухфакторной аутентификации с использованием OTP"
        parentSize: root
    }

    TextInputCustom {
        id: ipAdres
        parentSize: root

        backgroundText: "127.0.0.1"
        headerText: "IP адрес или имя (hostname) целевого рабочего места"

        height: root.height * 0.08
        width: root.width * 0.8

        anchors.left: root.left
        anchors.top: header.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.04
    }

    TextInputCustom {
        id: port
        parentSize: root

        backgroundText: "8008"
        headerText: "Порт"

        height: root.height * 0.08

        anchors.left: ipAdres.right
        anchors.right: root.right
        anchors.top: header.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.04
    }

    ComboBoxCustomButton {
        id: protocol

        ListModel {
            id: dataModelProtocol

            ListElement {
                text: "HTTP"
            }
            ListElement {
                text: "HTTPS"
            }
        }

        text_: "HTTP"
        headerText: "Протокол"

        model: dataModelProtocol
        parentSize: root

        height: root.height * 0.08
        width: root.width * 0.2

        anchors.left: root.left
        anchors.top: ipAdres.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.04
    }

    ComboBoxCustomButton {
        id: endPoint

        ListModel {
            id: dataModelEndPoint

            ListElement {
                text: "/JASEngine/Default/AuthentificationService/rest"
            }
            ListElement {
                text: "/api/v4.1"
            }
        }

        text_: "/JASEngine/Default/AuthentificationService/rest"
        headerText: "Endpoint"

        model: dataModelEndPoint
        parentSize: root

        height: root.height * 0.08
        width: root.width * 0.6

        anchors.left: root.left
        anchors.top: protocol.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.04
    }

    TextInputCustom {
        id: systemId
        parentSize: root

        backgroundText: "JAS"
        headerText: "SystemId"

        height: root.height * 0.08
        width: root.width * 0.2

        anchors.left: root.left
        anchors.top: endPoint.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.04
    }

    ButtonCheckBoxText {
        id: checkBoxIsAuthUserNoJAS

        text_: "Разрешать авторизацию по доменному паролю, если пользователя нет в JAS"

        parentSize: root

        checked: false

        anchors.left: root.left
        anchors.top: systemId.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.02
    }

    ButtonCheckBoxText {
        text_: "Разрешить авторизацию по доменному паролю,\nесли для пользователя заблокированы все электронные ключи"

        parentSize: root

        checked: false

        anchors.left: root.left
        anchors.top: checkBoxIsAuthUserNoJAS.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.02
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
