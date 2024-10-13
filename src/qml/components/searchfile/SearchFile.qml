import QtQuick
import QtQuick.Dialogs

import "../textinput"
import "../button"

Rectangle {
    id: root

    property var parentSize: null
    property string headerText: ""

    signal changeFocus()

    height: parentSize.height * 0.08

    color: "transparent"

    TextInputCustom {
        id: pathToFile
        parentSize: root.parentSize

        headerText: root.headerText

        width: parentSize.width * 0.16
        height: parentSize.height * 0.1

        anchors.left: root.left
        anchors.right: setFile.left
        anchors.top: setFile.top
        anchors.bottom: setFile.bottom

        anchors.rightMargin: root.parentSize.width * 0.02

        onChangeFocus: {
            root.changeFocus()
        }
    }

    ButtonText {
        id: setFile
        parentSize: root.parentSize
        text_: "Выбрать"

        height: root.height

        anchors.right: root.right
        anchors.rightMargin: root.height * 0.02

        onFocusChanged: {
            root.changeFocus()
        }

        onClicked: {
            fileDialog.open()
        }

        FileDialog {
            id: fileDialog
            onAccepted: pathToFile.setText(selectedFile)
        }
    }

    anchors.right: parentSize.right
    anchors.left: parentSize.left
}
