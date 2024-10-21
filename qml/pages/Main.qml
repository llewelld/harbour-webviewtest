import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import "../components"

Page {
    Column {
        id: column
        anchors.fill: parent

        ToolBar {
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
                    console.log("CALLBACK: " + result);
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
