import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import "../button"
import "../text"
import "../view"
import "../cell"
import "../scroll"
import "../combobox"

TableCustom {
    delegates : DelegateChooser {
        DelegateChoice {
            column: 1
            delegate: ComboBoxCustomButton {
                ListModel {
                    id: dataModelKDC

                    ListElement {
                        text: "Только по ПИН-коду"
                    }
                    ListElement {
                        text: "По ПИН-коду и паролю"
                    }
                    ListElement {
                        text: "Только по паролю"
                    }
                }

                text_: "По ПИН-коду и паролю"

                model: dataModelKDC
                parentSize: parent

                implicitHeight: root_.height * 0.075
                implicitWidth: (root_.width * (1 / countColumns)) - (scrooll_.width * (1 / countColumns))
            }
        }
        DelegateChoice {
            delegate: CellText {
                id: cell

                implicitHeight: root_.height * 0.075
                implicitWidth: (root_.width * (1 / countColumns)) - (scrooll_.width * (1 / countColumns))

                bold: false
                text_: model.display
                colorText: "#D7D7D7"
                colorBackground: isSelected && tableView_.rowSelected === row ? "#E74117" : "#353436"

                AbstractButton {
                    id: button
                    anchors.fill: parent

                    onClicked: {
                        tableView_.rowSelected = row
                    }
                }
            }
        }
    }
}
