import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/table"
import "../components/popup"
import "../components/radio"

import "../popups"

ViewCustom {
    id: root
    signal next()
    signal back()

    TextHeader {
        id: header
        text: "Настройка локальной двухфакторной аутентификации без использования PKI"
        parentSize: root
    }

    TableCustomSetPolitycAuth {
        ListModel {
            id: headerModel
            ListElement {
                 display: "name"
            }
            ListElement {
                 display: "age"
            }
        }

        TableModel {
            id: userTable
            TableModelColumn { display: "name" }
            TableModelColumn { display: "age" }
            rows:[
                {name: "Tom22222222", age: 39},
                {name: "Bob", age: 43},
                {name: "Sam", age: 28},
                {name: "1", age: 39},
                {name: "2", age: 43},
                {name: "3", age: 28},
                {name: "4", age: 39},
                {name: "5", age: 43},
                {name: "6", age: 28},
                {name: "7", age: 39},
                {name: "8", age: 43},
                {name: "9", age: 28}
            ]
        }

        id: allLicenses
        topItem: header.bottom
        buttonItem: buttonTextLeft.top
        leftItem: root.left
        rightItem: root.right
        parentSize: root
        tableModel: userTable
        headerModel: headerModel
        isSelected: false
        countColumns: 2
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
