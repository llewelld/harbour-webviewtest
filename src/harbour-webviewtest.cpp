#include <QtQuick>

#include <sailfishapp.h>

int main(int argc, char *argv[])
{
  int result = 0;

  // SailfishApp::main() will display "qml/harbour-webviewtest.qml", if you need more
  // control over initialization, you can use:
  //
  //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
  //   - SailfishApp::createView() to get a new QQuickView * instance
  //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
  //   - SailfishApp::pathToMainQml() to get a QUrl to the main QML file
  //
  // To display the view, call "show()" (will show fullscreen on device).

  QGuiApplication *app = SailfishApp::application(argc, argv);

  QQuickView *view = SailfishApp::createView();
  // The engine takes ownership of the ImageProvider
  view->setSource(SailfishApp::pathTo("qml/harbour-webviewtest.qml"));

  QQmlContext *ctxt = view->rootContext();


  QString domwalk;
  QFile file("/usr/share/harbour-webviewtest/qml/js/DomWalk.js");
  if (file.open(QIODevice::ReadOnly)) {
      QTextStream in(&file);
      domwalk = file.readAll();
      file.close();
  }
  ctxt->setContextProperty("domwalk", domwalk);

  view->show();

  result = app->exec();

  return result;
}
