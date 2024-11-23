/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import "../components"

Page {
    Column {
        anchors.fill: parent

        NavBar {
            id: toolbar
            webview: webview
            width: parent.width
        }

        WebView {
            id: webview
            width: parent.width
            height: parent.height - (2 * Theme.iconSizeLarge)
            url: "https://www.whatsmybrowser.org/"
            onUrlChanged: toolbar.urltext.text = url
            Component.onCompleted: {
                WebEngineSettings.javascriptEnabled = true
            }

            function getInfo() {
                runJavaScript(domwalk, function(result) {
                    infobar.dominfo = JSON.parse(result);
                });
            }
        }

        InfoBar {
            id: infobar
            width: parent.width
        }
    }
}
