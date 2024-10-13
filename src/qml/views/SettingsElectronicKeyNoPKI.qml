import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/table"
import "../components/popup"
import "../components/radio"
import "../components/listview"

import "../popups"

ViewCustom {
    property string textInNexButton: "Вперед"
    property int isSettings: 0 // 0 - стандартная работа с профилями, 1 - работа с профилями по сетевой, 2 - работа с профилями по локальной

    id: root

    signal next()
    signal back()

    TextHeader {
        id: header
        text: isSettings === 0 ? "Профили на электронных ключах" : isSettings === 1 ? "Профили на электронных ключах для сетевой без PKI" : "Профили на электронных ключах для локальной без PKI"
        parentSize: root
    }

    Rectangle {
        id: globalRectangle

        color: "#4F4F4F"
        radius: root.height * 0.01 < root.width * 0.01 ? root.height * 0.01 : root.width * 0.01

        anchors.top: header.bottom
        anchors.bottom: buttonTextLeft.top
        anchors.left: root.left
        anchors.right: root.right

        ListViewImageText {
            id: listToken

            ListModel {
                id: dataModel

                ListElement {
                    image: "qrc:/images/001.png"
                    text: "first"
                }
                ListElement {
                    image: "qrc:/images/001.png"
                    text: "second"
                }
                ListElement {
                    image: "qrc:/images/001.png"
                    text: "third"
                }
                ListElement {
                    image: "qrc:/images/001.png"
                    text: "fourth"
                }
                ListElement {
                    image: "qrc:/images/001.png"
                    text: "five"
                }
            }

            parentSize: root
            dataModel: dataModel
            backRectangle: globalRectangle

            anchors.topMargin: root.height * 0.02
            anchors.bottomMargin: root.height * 0.02
            anchors.leftMargin: root.width * 0.02
            anchors.rightMargin: root.width * 0.70
        }

        Rectangle {
            id: listCommand

            color: "#353436"
            radius: root.height * 0.01 < root.width * 0.01 ? root.height * 0.01 : root.width * 0.01

            border.width: root.height * 0.002 > root.width * 0.002 ? root.height * 0.002 : root.width * 0.002
            border.color: "#D7D7D7"

            anchors.top: globalRectangle.top
            anchors.bottom: globalRectangle.bottom
            anchors.left: listToken.right
            anchors.right: globalRectangle.right

            anchors.topMargin: root.height * 0.02
            anchors.bottomMargin: root.height * 0.70
            anchors.leftMargin: root.width * 0.02
            anchors.rightMargin: root.width * 0.02

            Row {
                id: rowButton

                layoutDirection: Qt.RightToLeft

                anchors.top: listCommand.top
                anchors.bottom: listCommand.bottom
                anchors.left: listCommand.left
                anchors.right: listCommand.right

                anchors.topMargin: root.height * 0.02
                anchors.bottomMargin: root.height * 0.02
                anchors.leftMargin: root.width * 0.02
                anchors.rightMargin: root.width * 0.02

                spacing: root.width * 0.02

                ButtonImage {
                    id: deleteElement

                    parentSize: root
                    imagePath: "qrc:/images/delete_24px.svg"

                    height: rowButton.height
                    width: rowButton.height
                }

                ButtonImage {
                    id: editElement

                    parentSize: root
                    imagePath: "qrc:/images/mode_24px.svg"

                    height: rowButton.height
                    width: rowButton.height
                }

                ButtonImage {
                    id: createElement

                    parentSize: root
                    imagePath: "qrc:/images/add_24px.svg"

                    height: rowButton.height
                    width: rowButton.height
                }

                ButtonImage {
                    id: infoElement

                    parentSize: root
                    imagePath: "qrc:/images/info_outline_24px.svg"

                    height: rowButton.height
                    width: rowButton.height
                }
            }
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
                id: userTable1
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

            id: listElements
            topItem: listCommand.bottom
            buttonItem: globalRectangle.bottom
            leftItem: listToken.right
            rightItem: globalRectangle.right
            parentSize: root
            tableModel: userTable1
            headerModel: headerModel
            isSelected: true
            countColumns: 5
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
        text_: textInNexButton

        parentSize: root

        onClicked: {
            next()
        }
    }
}
