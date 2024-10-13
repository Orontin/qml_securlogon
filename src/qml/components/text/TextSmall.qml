import QtQuick

import "../../common"

TextCustom {
    id: root

    font.pointSize: Common.__height__ * 0.015 < Common.__width__ * 0.015 ? Common.__height__ * 0.015 : Common.__width__ * 0.015
}
