import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Column {
        width: parent.width
        height: parent.height - (2 * Theme.paddingLarge)
        y: 2 * Theme.paddingLarge
        spacing: Theme.paddingLarge

        Label {
            id: label
            width: parent.width
            horizontalAlignment: "AlignHCenter"
            text: qsTr("Gecko WebView")
        }

        Label {
            width: parent.width
            horizontalAlignment: "AlignHCenter"
            text: qsTr("Demo")
        }
    }
}
