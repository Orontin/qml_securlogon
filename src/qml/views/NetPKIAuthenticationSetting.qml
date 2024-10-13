import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import "../components/button"
import "../components/text"
import "../components/view"
import "../components/listview"
import "../components/table"
import "../components/popup"
import "../components/radio"
import "../components/textinput"
import "../components/searchfile"
import "../components/combobox"
import "../popups"

ViewCustom {
    id: root
    signal next()
    signal toOTP()
    signal back()

    TextHeader {
        id: header
        text: "Настройка сетевой дфухфакторной аутентификации с использованием PKI"
        parentSize: root
    }

    RadioColumn {
        id: radioColumn
        buttonItem: buttonTextLeft
        topItem: header
        parentSize: root

        RadioButtonCustom {
            id: addedCertsIsElectronicKey
            handleText: "C электронных ключей"
            bodyText: "Взять цепочку сертификатов из электронного ключа"

            parentSize: root

            checked: true
        }
        SearchFilesCheckComboBox {
            ListModel {
                id: dataModelCert

                ListElement {
                    text: "root1.crt"
                }
                ListElement {
                    text: "root2.crt"
                }
                ListElement {
                    text: "root3.crt"
                }
                ListElement {
                    text: "root4.crt"
                }
                ListElement {
                    text: "root5.crt"
                }
                ListElement {
                    text: "root6.crt"
                }
                ListElement {
                    text: "root7.crt"
                }
            }

            id: searchTokensCerts

            headerText: "Сертификаты"
            parentSize: root
            dataModel: dataModelCert
            rightComponent: setCerts

            anchors.left: radioColumn.left
            anchors.right: radioColumn.right

            onClickOpen: {
                addedCertsIsElectronicKey.checked = true
            }

            ButtonText {
                id: setCerts
                parentSize: searchTokensCerts.parentSize
                text_: "Обновить"

                anchors.top: searchTokensCerts.top
                anchors.bottom: searchTokensCerts.bottom
                anchors.right: searchTokensCerts.right

                anchors.topMargin: searchTokensCerts.height * 0.1
                anchors.bottomMargin: searchTokensCerts.height * 0.1

                onFocusChanged: {
                    searchTokensCerts.clickOpen()
                }

                onClicked: {}
            }
        }
        RadioButtonCustom {
            id: addedCertsIsFileSystem
            handleText: "C файловой системы"
            bodyText: "Взять цепочку сертификатов из файловой системы"

            parentSize: root
        }
        SearchFilesCheckComboBox {
            ListModel {
                id: dataModelFiles

                ListElement {
                    text: "/images/00112233.crt"
                }
                ListElement {
                    text: "/images/00223344.crt"
                }
                ListElement {
                    text: "/images/00334455.crt"
                }
                ListElement {
                    text: "/images/00445566.crt"
                }
                ListElement {
                    text: "/images/00556677.crt"
                }
                ListElement {
                    text: "/images/00667788.crt"
                }
                ListElement {
                    text: "/images/00778899.crt"
                }
            }

            id: searchFilesCerts

            headerText: "Сертификаты"
            parentSize: root
            dataModel: dataModelFiles
            rightComponent: setFiles

            anchors.left: radioColumn.left
            anchors.right: radioColumn.right

            onClickOpen: {
                addedCertsIsFileSystem.checked = true
            }

            ButtonText {
                id: setFiles
                parentSize: searchFilesCerts.parentSize
                text_: "Выбрать"

                anchors.top: searchFilesCerts.top
                anchors.bottom: searchFilesCerts.bottom
                anchors.right: searchFilesCerts.right

                anchors.topMargin: searchFilesCerts.height * 0.1
                anchors.bottomMargin: searchFilesCerts.height * 0.1

                onFocusChanged: {
                    searchFilesCerts.clickOpen()
                }

                onClicked: {
                    fileDialog.open()
                }

                FileDialog {
                    id: fileDialog
                }
            }
        }
        RadioButtonCustom {
            id: addedCertsIsDomain
            handleText: "C домена"
            bodyText: "Взять цепочку сертификатов из домена"

            parentSize: root
        }
        TextInputCustom {
            id: pathToCertFromDomain
            parentSize: root

            backgroundText: "http://<адрес_сервера>"
            headerText: "Адрес домена"

            height: root.height * 0.08

            anchors.left: radioColumn.left
            anchors.right: radioColumn.right

            onChangeFocus: {
                addedCertsIsDomain.checked = true
            }
        }
    }

    SearchFile {
        parentSize: root
        headerText: "Путь до хранилища корневых сертификатов"

        anchors.bottom: checkSettings.top
        anchors.left: root.left
        anchors.right: root.right

        anchors.bottomMargin: root.height * 0.02
        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.02
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
            listKDC.open()
        }
    }

    ListKDC {
        id: listKDC
        parentSize: root

        onOk: {
            listKDC.close()
            postCheckSettingsWindow.open()
        }

        onCancel: {
            listKDC.close()
        }
    }

    PostCheckSettingsWindow {
        id: postCheckSettingsWindow

        parentSize: root

        onOk: {
            postCheckSettingsWindow.close()
            dialogSetOTP.open()
        }
    }

    DialogSetOTP {
        id: dialogSetOTP
        parentSize: root

        onYes: {
            toOTP()
        }

        onNo: {
            next()
        }
    }
}
