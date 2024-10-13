import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import "../button"
import "../text"
import "../view"
import "../listview"
import "../table"
import "../popup"
import "../radio"
import "../textinput"
import "../searchfile"
import "../combobox"

Rectangle {
    property var parentSize: null
    property var dataModel: null
    property var rightComponent: null
    property string headerText: ""

    signal clickOpen()

    id: root

    color: "transparent"

    height: root.parentSize.height * 0.1

    ComboBoxCustomCheckBox {
        id: comboBoxCheckBox
        model: dataModel
        parentSize: root.parentSize
        headerText: root.headerText

        anchors.left: root.left
        anchors.right: rightComponent.left
        anchors.top: rightComponent.top
        anchors.bottom: rightComponent.bottom

        anchors.rightMargin: root.width * 0.02

        onClicked: {
            root.clickOpen()
        }
    }

    ButtonText {
        id: setFiles
        parentSize: root.parentSize
        text_: "Выбрать"

        anchors.top: root.top
        anchors.bottom: root.bottom
        anchors.right: root.right

        anchors.topMargin: root.height * 0.1
        anchors.bottomMargin: root.height * 0.1

        onFocusChanged: {
            root.clickOpen()
        }

        onClicked: {
            fileDialog.open()
        }

        FileDialog {
            id: fileDialog
        }
    }
}
