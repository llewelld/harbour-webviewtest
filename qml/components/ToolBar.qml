import QtQuick 2.6
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import "."

Row {
    id: toolbar
    height: Theme.iconSizeLarge
    property WebView webview
    property alias urltext: urltext

    ToolButton {
        icon.source: "image://theme/icon-m-back"
        onClicked: toolbar.webview.goBack()
        enabled: toolbar.webview.canGoBack
    }

    ToolButton {
        icon.source: "image://theme/icon-m-forward"
        onClicked: toolbar.webview.goForward()
        enabled: toolbar.webview.canGoForward
    }

    ToolButton {
        icon.source: "image://theme/icon-m-about"
        onClicked: toolbar.webview.getInfo()
    }

    TextField {
        id: urltext
        y: (Theme.iconSizeLarge - Theme.iconSizeMedium) / 2
        height: Theme.iconSizeMedium
        labelVisible: false
        placeholderText: "Enter the URL"
        text: toolbar.webview.url
        width: parent.width - (3 * Theme.iconSizeMedium)
        EnterKey.onClicked: toolbar.webview.url = text
    }
}
