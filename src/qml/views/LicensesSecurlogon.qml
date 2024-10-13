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
    property string textInNexButton: "Вперед"

    id: root
    signal next()
    signal back()

    TextHeader {
        id: header
        text: "Список лицензий"
        parentSize: root
    }

    TableCustomOnlyText {
        ListModel {
            id: headerModel
            ListElement {
                 display: "qqqq"
            }
            ListElement {
                 display: "wwww"
            }
            ListElement {
                 display: "eeeee"
            }
            ListElement {
                 display: "name"
            }
            ListElement {
                 display: "age"
            }
        }

        TableModel {
            id: userTable
            TableModelColumn { display: "qqqq" }
            TableModelColumn { display: "wwww" }
            TableModelColumn { display: "eeeee" }
            TableModelColumn { display: "name" }
            TableModelColumn { display: "age" }
            rows:[
                {qqqq: "1", wwww: "2", eeeee: "3", name: "Tom22222222", age: 39},
                {qqqq: "2", wwww: "2", eeeee: "3", name: "Bob", age: 43},
                {qqqq: "3", wwww: "2", eeeee: "3", name: "Sam", age: 28},
                {qqqq: "4", wwww: "2", eeeee: "3", name: "1", age: 39},
                {qqqq: "5", wwww: "2", eeeee: "3", name: "2", age: 43},
                {qqqq: "6", wwww: "2", eeeee: "3", name: "3", age: 28},
                {qqqq: "7", wwww: "2", eeeee: "3", name: "4", age: 39},
                {qqqq: "8", wwww: "2", eeeee: "3", name: "5", age: 43},
                {qqqq: "9", wwww: "2", eeeee: "3", name: "6", age: 28},
                {qqqq: "0", wwww: "2", eeeee: "3", name: "7", age: 39},
                {qqqq: "1", wwww: "2", eeeee: "3", name: "8", age: 43},
                {qqqq: "1", wwww: "2", eeeee: "3", name: "9", age: 28}
            ]
        }

        id: allLicenses
        topItem: header.bottom
        buttonItem: centr.top
        leftItem: root.left
        rightItem: root.right
        parentSize: root
        tableModel: userTable
        headerModel: headerModel
        isSelected: false
        countColumns: 5
    }

    TextMedium {
        id: centr
        text: "NoPKI - Активно | PKI - Активно | RuToken - Активно | GUI - Активно | TechSupport - Активно"

        font.bold: true

        anchors.right: root.right
        anchors.left: root.left
        anchors.top: root.top
        anchors.bottom: buttonTextLeft.top

        anchors.rightMargin: root.width * 0.02
        anchors.leftMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.8
        anchors.bottomMargin: root.height * 0.02
    }

    ButtonTextLeft {
        id: buttonTextLeft
        text_: "Назад"

        parentSize: root

        onClicked: {
            back()
        }
    }

    ButtonText {
        id: addedNewLicense
        text_: "Добавить лицензию"

        parentSize: root

        anchors.left: buttonTextLeft.right
        anchors.bottom: root.bottom
        anchors.leftMargin: parentSize.width * 0.02
        anchors.bottomMargin: parentSize.height * 0.02

        onClicked: {
            popupAddedNewLicense.open()
        }
    }

    AddedNewLicense {
        id: popupAddedNewLicense
        parentSize: root
    }

    ButtonText {
        id: testTimeLicense
        text_: "Временная лицензия"

        parentSize: root

        anchors.left: addedNewLicense.right
        anchors.bottom: root.bottom
        anchors.leftMargin: parentSize.width * 0.02
        anchors.bottomMargin: parentSize.height * 0.02

        onClicked: {
            next()
        }
    }

    ButtonTextRight {
        text_: textInNexButton

        parentSize: root

        onClicked: {
            next()
        }
    }
}
