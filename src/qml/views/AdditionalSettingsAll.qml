import QtQuick
import QtQuick.Controls

import "../components/button"
import "../components/radio"
import "../components/text"
import "../components/view"

ViewCustom {
    property bool isVisibleActionRDP: false
    property bool isVisibleActionSystem: false
    property bool isVisibleResetCheck: false
    property bool isVisibleCheckSwitchWindows: false

    id: root

    signal exit()
    signal back()

    TextHeader {
        id: header
        parentSize: root

        text: "Дополнительные настройки"
    }

    TextMedium {
        id: headerRadioColumnActionSystem

        text: "Действие с системой при извелечении электронного ключа"

        visible: isVisibleActionSystem

        font.bold: true

        anchors.left: visible === false ? undefined : root.left
        anchors.right: visible === false ? undefined : root.right
        anchors.top: visible === false ? undefined : header.bottom

        anchors.leftMargin: visible === false ? 0 : root.width * 0.02
        anchors.rightMargin: visible === false ? 0 : root.width * 0.02
        anchors.topMargin: visible === false ? 0 : root.height * 0.01
    }

    RadioColumn {
        id: actionSystem

        parentSize: root

        visible: isVisibleActionSystem

        RadioButtonCustom {
            id: blockedSession
            handleText: "Блокировать сессию пользователя"
            bodyText: "Будет запущенно окно блокировки для всех X-сессий в которые пользователь вошел с помощью электронного ключа"

            visible: actionSystem.visible

            parentSize: actionSystem.parentSize

            checked: true
        }
        RadioButtonCustom {
            id: powerOffComputer
            handleText: "Выключить компьютер"
            bodyText: "Кшомпьютер будет немеделнно выключен"

            visible: actionSystem.visible

            parentSize: actionSystem.parentSize
        }
        RadioButtonCustom {
            id: ignoreSession
            handleText: "Игнорировать"
            bodyText: "Ничего не произойдет"

            visible: actionSystem.visible

            parentSize: actionSystem.parentSize
        }

        anchors.left: root.left
        anchors.top: headerRadioColumnActionSystem.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.01
    }

    TextMedium {
        id: headerRadioColumnActionRemoveSession

        visible: isVisibleActionRDP

        text: "Действие с открытой удаленной сессией при извелечении электронного ключа"

        font.bold: true

        anchors.left: visible === false ? undefined : root.left
        anchors.right: visible === false ? undefined : root.right
        anchors.top: visible === false ? undefined : actionSystem.bottom

        anchors.leftMargin: visible === false ? 0 : root.width * 0.02
        anchors.rightMargin: visible === false ? 0 : root.width * 0.02
        anchors.topMargin: visible === false ? 0 : root.height * 0.01
    }

    RadioColumn {
        id: actionRemoveSession

        parentSize: root

        visible: isVisibleActionRDP

        RadioButtonCustom {
            id: closeRemoveSession
            handleText: "Закрыть удаленную сессию"
            bodyText: "Открытая с помощью электронного ключа удаленная сессия будет немедленно завершена"

            parentSize: actionRemoveSession.parentSize

            visible: actionRemoveSession.visible

            checked: true
        }
        RadioButtonCustom {
            id: ignoreRemoveSession
            handleText: "Игнорировать"
            bodyText: "Ничего не произойдет"

            parentSize: actionRemoveSession.parentSize

            visible: actionRemoveSession.visible
        }

        anchors.left: root.left
        anchors.top: headerRadioColumnActionRemoveSession.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.01
    }

    ButtonCheckBoxText {
        id: checkBoxWindow

        text_: "Включить окна входа\\блокировки SecurLogon"

        visible: isVisibleCheckSwitchWindows

        parentSize: root

        checked: true

        anchors.left: root.left
        anchors.top: actionRemoveSession.visible ? actionRemoveSession.bottom : actionSystem.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.01
    }

    ButtonCheckBoxText {
        text_: "Перезагрузить ОС после закрытия SecurLogon"

        parentSize: root

        visible: isVisibleResetCheck

        checked: true

        anchors.left: root.left
        anchors.top: checkBoxWindow.bottom

        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.01
    }

    ButtonTextLeft {
        text_: "Назад"

        parentSize: root

        onClicked: {
            back()
        }
    }

    ButtonTextRight {
        text_: "Завершить"

        parentSize: root

        onClicked: {
            exit()
        }
    }
}
