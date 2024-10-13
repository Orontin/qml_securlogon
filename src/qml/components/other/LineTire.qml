import QtQuick 

Rectangle {
    id: lineTire

    property var parentSize: null

    width: parentSize.width * 0.05
    height: parentSize.height * 0.1

    color: "transparent"

    Rectangle {
        radius: parentSize.height * 0.01 < parentSize.width * 0.01 ? parentSize.height * 0.01 : parentSize.width * 0.01

        width: lineTire.width
        height: lineTire.height * 0.1

        color: "#D7D7D7"

        anchors.centerIn: lineTire
    }
}
