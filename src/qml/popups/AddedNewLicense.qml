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
import "../components/inputoldkey"

PopupCustomWindow {
    id: root

    Rectangle {
        id: rectangle
        color: "#4F4F4F"

        anchors.fill: parent

        TextHeader {
            id: header
            text: "Добавить новую лицензию"
            parentSize: rectangle
        }

        RadioColumn {
            id: radioColumn
            buttonItem: buttonTextLeft
            topItem: header
            parentSize: rectangle
            isSpacing: true

            RadioButtonCustom {
                id: addedLicenseAES
                handleText: "Ввести лицензионный ключ"
                bodyText: "Можно активировать только старый формат лицензионного ключа"

                parentSize: rectangle
            }
            InputOldKey {
                parentSize: radioColumn

                onChangeFocus: {
                    addedLicenseAES.checked = true
                }
            }
            RadioButtonCustom {
                id: addedLicenseJWS
                handleText: "Добавить лицензию из файла"
                bodyText: "Можно активировать как старый так и новый формат лицензионного ключа"

                parentSize: rectangle

                checked: true
            }
            SearchFile {
                parentSize: radioColumn
                headerText: "Путь до файла с лицензией"

                height: root.height * 0.08

                onChangeFocus: {
                    addedLicenseJWS.checked = true
                }
            }
            RadioButtonCustom {
                id: addedTestLicense
                handleText: "Активировать пробную лицензию на 90 дней"
                bodyText: "В пробной лицензии активируются noPKI PKI GUI TechSupport"

                parentSize: rectangle
            }
        }

        ButtonTextLeft {
            id: buttonTextLeft
            text_: "Назад"

            anchorsLeft: rectangle.left
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
            }
        }

        ButtonTextRight {
            text_: "Вперед"

            anchorsRight: rectangle.right
            anchorsBottom: rectangle.bottom
            parentSize: root.parentSize

            onClicked: {
                root.close()
            }
        }
    }
}
