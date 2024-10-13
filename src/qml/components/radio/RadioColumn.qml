import QtQuick

Column {
    property var topItem: null
    property var buttonItem: null
    property var parentSize: null
    property bool isSpacing: false

    id: root

    spacing: isSpacing ? parentSize.height * 0.01 : 0

    anchors.left: parentSize.left
    anchors.right: parentSize.right
    anchors.top: topItem === null || visible === false ? undefined : topItem.bottom
    anchors.bottom: buttonItem === null || visible === false ? undefined : buttonItem.top

    anchors.leftMargin: visible === false ? 0 : parentSize.width * 0.02
    anchors.rightMargin: visible === false ? 0 : parentSize.width * 0.02
    anchors.topMargin: visible === false ? 0 : parentSize.height * 0.02
    anchors.bottomMargin: visible === false ? 0 : parentSize.height * 0.02
}
