import QtQuick

import "../../common"

TextCustom {
    id: root

    font.pointSize: Common.__height__ * 0.03 < Common.__width__ * 0.03 ? Common.__height__ * 0.03 : Common.__width__ * 0.03
}
