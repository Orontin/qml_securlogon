import "../../common"

ButtonText {
    property var anchorsLeft: null
    property var anchorsBottom: null

    id: root

    anchors.left: anchorsLeft === null ? parentSize.left : anchorsLeft
    anchors.bottom: anchorsBottom  === null ? parentSize.bottom : anchorsBottom

    anchors.leftMargin: parentSize.width * 0.02
    anchors.bottomMargin: parentSize.height * 0.02
}
