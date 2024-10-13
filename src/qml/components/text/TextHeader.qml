import QtQuick

TextBig {
    id: root
    property var parentSize: null

    font.bold: true

    anchors.right: parentSize.right
    anchors.left: parentSize.left
    anchors.rightMargin: parentSize.width * 0.02
    anchors.leftMargin: parentSize.width * 0.02
}
