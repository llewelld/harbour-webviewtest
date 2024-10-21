import QtQuick 2.6
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    initialPage: Component { Main { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
