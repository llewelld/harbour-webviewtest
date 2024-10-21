import QtQuick 2.6
import Sailfish.Silica 1.0

Row {
    id: infobar
    height: Theme.iconSizeLarge
    leftPadding: Theme.paddingSmall

    property var dominfo: {
        "nodes": 0,
        "maxdepth": 0,
        "maxbreadth": 0
    }

    Label {
        id: nodes
        text: "Nodes: " + infobar.dominfo.nodes
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.highlightColor
        width: parent.width / 3
    }

    Label {
        id: depth
        anchors.verticalCenter: parent.verticalCenter
        text: "Height: " + infobar.dominfo.maxdepth
        color: Theme.highlightColor
        width: parent.width / 3
    }

    Label {
        id: breadth
        text: "Width: " + infobar.dominfo.maxbreadth
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.highlightColor
        width: parent.width / 3
    }
}
