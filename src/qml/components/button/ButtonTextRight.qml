import "../../common"

ButtonText {
    property var anchorsRight: null
    property var anchorsBottom: null

    id: root

    anchors.right: anchorsRight === null ? parentSize.right : anchorsRight
    anchors.bottom: anchorsBottom  === null ? parentSize.bottom : anchorsBottom
    anchors.rightMargin: parentSize.width * 0.02
    anchors.bottomMargin: parentSize.height * 0.02
}
