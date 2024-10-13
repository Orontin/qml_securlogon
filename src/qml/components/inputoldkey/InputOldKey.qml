import QtQuick 

import "../other"
import "../textinput"

Rectangle {
    id: root
    property var parentSize: null

    signal changeFocus()

    height: parentSize.height * 0.1

    color: "transparent"

    anchors.right: parentSize.right
    anchors.left: parentSize.left

    Row {
        TextInputCustom {
            id: textInputCustom1
            parentSize: root.parentSize
            maximumLength: 5
            alignHorizontal: Text.AlignHCenter

            height: root.parentSize.height * 0.10
            width: root.parentSize.width * 0.16

            onFinishLength: {
                textInputCustom2.setFocus()
            }

            onChangeFocus: {
                root.changeFocus()
            }
        }
        LineTire {
            parentSize: root.parentSize
        }
        TextInputCustom {
            id: textInputCustom2
            parentSize: root.parentSize
            maximumLength: 5
            alignHorizontal: Text.AlignHCenter

            height: root.parentSize.height * 0.10
            width: root.parentSize.width * 0.16

            onFinishLength: {
                textInputCustom3.setFocus()
            }
            onStartLength: {
                textInputCustom1.setFocus()
            }

            onChangeFocus: {
                root.changeFocus()
            }
        }
        LineTire {
            parentSize: root.parentSize
        }
        TextInputCustom {
            id: textInputCustom3
            parentSize: root.parentSize
            maximumLength: 5
            alignHorizontal: Text.AlignHCenter

            height: root.parentSize.height * 0.10
            width: root.parentSize.width * 0.16

            onFinishLength: {
                textInputCustom4.setFocus()
            }
            onStartLength: {
                textInputCustom2.setFocus()
            }

            onChangeFocus: {
                root.changeFocus()
            }
        }
        LineTire {
            parentSize: root.parentSize
        }
        TextInputCustom {
            id: textInputCustom4
            parentSize: root.parentSize
            maximumLength: 5
            alignHorizontal: Text.AlignHCenter

            height: root.parentSize.height * 0.10
            width: root.parentSize.width * 0.16

            onFinishLength: {
                textInputCustom5.setFocus()
            }
            onStartLength: {
                textInputCustom3.setFocus()
            }

            onChangeFocus: {
                root.changeFocus()
            }
        }
        LineTire {
            parentSize: root.parentSize
        }
        TextInputCustom {
            id: textInputCustom5
            parentSize: root.parentSize
            maximumLength: 5
            alignHorizontal: Text.AlignHCenter

            height: root.parentSize.height * 0.10
            width: root.parentSize.width * 0.16

            onStartLength: {
                textInputCustom4.setFocus()
            }

            onChangeFocus: {
                root.changeFocus()
            }
        }
    }
}
