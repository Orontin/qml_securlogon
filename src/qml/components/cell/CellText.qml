import QtQuick
import QtQuick.Controls

import "../text"

Rectangle {
    id: root

    property string text_: ""
    property bool bold: false
    property string colorText: ""
    property string colorBackground: ""

    color: colorBackground

    TextMedium {
        text: text_

        color: colorText

        font.bold: bold

        anchors.fill: root

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
