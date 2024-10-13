import QtQuick

import "../components/button"
import "../components/text"
import "../components/textinput"
import "../components/view"
import "../components/table"
import "../components/popup"
import "../components/radio"
import "../components/searchfile"
import "../components/other"
import "../components/listview"
import "../components/inputoldkey"

PopupCustomWindow {
    signal ok()
    signal cancel()
    id: root

    Rectangle {
        id: rectangle
        color: "transparent"

        anchors.fill: parent

        TextHeader {
            id: header
            text: "Список KDC"
            parentSize: rectangle
        }

        Rectangle {
            id: backgroundList

            color: "#4F4F4F"

            anchors.left: rectangle.left
            anchors.right: rectangle.right
            anchors.top: header.bottom
            anchors.bottom: buttonTextLeft.top

            ListModel {
                id: dataModelKDC

                ListElement {
                    text: "kdc"
                }
                ListElement {
                    text: "kdc.kdc"
                }
                ListElement {
                    text: "kdc.kdc.kdc"
                }
                ListElement {
                    text: "kdc.kdc.kdc.kdc"
                }
                ListElement {
                    text: "kdc.kdc.kdc.kdc.kdc"
                }
                ListElement {
                    text: "kdc.kdc.kdc.kdc.kdc.kdc"
                }
                ListElement {
                    text: "kdc.kdc.kdc.kdc.kdc.kdc.kdc"
                }
            }

            ListViewCheckBox {
                parentSize: root.parentSize
                dataModel: dataModelKDC

                anchors.left: backgroundList.left
                anchors.right: backgroundList.right
                anchors.top: backgroundList.top
                anchors.bottom: backgroundList.bottom

                anchors.leftMargin: parentSize.height * 0.02
                anchors.rightMargin: parentSize.height * 0.02
                anchors.topMargin: parentSize.width * 0.02
                anchors.bottomMargin: parentSize.width * 0.02

                backRectangle: backgroundList
            }
        }

        ButtonTextLeft {
            id: buttonTextLeft
            text_: "Отменить"

            anchorsLeft: rectangle.left
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
                cancel()
            }
        }

        ButtonText {
            id: addedElement
            text_: "Добавить"

            parentSize: root.parentSize

            anchors.left: buttonTextLeft.right
            anchors.bottom: rectangle.bottom
            anchors.leftMargin: parentSize.width * 0.02
            anchors.bottomMargin: parentSize.height * 0.02

            onClicked: {

            }
        }

        ButtonTextRight {
            text_: "Принять"

            anchorsRight: rectangle.right
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
                ok()
            }
        }
    }
}
