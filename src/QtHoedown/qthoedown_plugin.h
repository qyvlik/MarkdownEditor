#ifndef QTHOEDOWN_PLUGIN_H
#define QTHOEDOWN_PLUGIN_H

#include <QQmlExtensionPlugin>

class QtHoedownPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // QTHOEDOWN_PLUGIN_H

