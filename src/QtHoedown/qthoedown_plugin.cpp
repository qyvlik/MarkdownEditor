#include "qthoedown_plugin.h"

#include "src/hoedown/hoedownmarkdownconverter.h"

#include <qqml.h>

void QtHoedownPlugin::registerTypes(const char *uri)
{
    // @uri org.gdpurjyfs.markdown
    qmlRegisterType<HoedownMarkdownConverter>(uri, 1, 0, "HoedownMarkdownConverter");
}


