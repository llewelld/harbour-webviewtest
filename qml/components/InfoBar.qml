/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick 2.6
import Sailfish.Silica 1.0

Row {
    height: Theme.iconSizeLarge
    leftPadding: Theme.paddingSmall

    property var dominfo: {
        "nodes": 0,
        "maxdepth": 0,
        "maxbreadth": 0
    }

    InfoText {
        text: qsTr("Nodes: %1").arg(dominfo.nodes)
    }

    InfoText {
        text: qsTr("Height: %1").arg(dominfo.maxdepth)
    }

    InfoText {
        text: qsTr("Width: %1").arg(dominfo.maxbreadth)
    }
}
