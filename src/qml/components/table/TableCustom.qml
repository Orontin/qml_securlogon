import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import "../button"
import "../text"
import "../view"
import "../cell"
import "../scroll"
import "../combobox"

Rectangle {
    property var topItem: null
    property var buttonItem: null
    property var leftItem: null
    property var rightItem: null
    property var parentSize: null
    property var tableModel: null
    property var headerModel: null
    property bool isSelected: false
    property int countColumns: 0
    property var delegates: null
    property var tableView_: tableView
    property var root_: root
    property var scrooll_: scrooll

    id: root

    color: "#D7D7D7"

    bottomLeftRadius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01
    bottomRightRadius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

    border.width: parentSize.height * 0.002 > parentSize.width * 0.002 ? parentSize.height * 0.002 : parentSize.width * 0.002
    border.color: parentSize.hovered ? "#E74117" : "#D7D7D7"

    anchors.left: leftItem
    anchors.right: rightItem
    anchors.top: topItem
    anchors.bottom: buttonItem

    anchors.rightMargin: parentSize.width * 0.02
    anchors.leftMargin: parentSize.width * 0.02
    anchors.topMargin: parentSize.height * 0.02
    anchors.bottomMargin: parentSize.height * 0.02

    HorizontalHeaderView {
        id: horizontalHeader

        clip: true

        model: headerModel

        columnSpacing: root.height * 0.002 > root.width * 0.002 ? root.height * 0.002 : root.width * 0.002

        syncView: tableView

        anchors.left: root.left
        anchors.right: root.right
        anchors.top: root.top

        delegate: CellText {
            implicitHeight: root.height * 0.075
            implicitWidth: root.width * (1 / countColumns)

            bold: true
            text_: model.display
            colorText: "#353436"
            colorBackground: "#D7D7D7"
        }
    }

    TableView {
        id: tableView

        rowSpacing: root.height * 0.002 > root.width * 0.002 ? root.height * 0.002 : root.width * 0.002
        clip: true

        model: tableModel

        anchors.left: root.left
        anchors.right: root.right
        anchors.top: horizontalHeader.bottom
        anchors.bottom: root.bottom

        property int rowSelected : -1;

        delegate: delegates

        ScrollBar.vertical: ScrollCustom {
            id: scrooll

            topItem: root
            parentSize: tableView
        }
    }
}
