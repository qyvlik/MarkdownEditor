
INCLUDEPATH += $$PWD/hoedown/src

HEADERS += \
    $$PWD/hoedown/src/autolink.h \
    $$PWD/hoedown/src/buffer.h \
    $$PWD/hoedown/src/document.h \
    $$PWD/hoedown/src/escape.h \
    $$PWD/hoedown/src/html.h \
    $$PWD/hoedown/src/stack.h \
    $$PWD/hoedown/src/version.h \
#    $$PWD/hoedown/bin/common.h \
    $$PWD/hoedown/hoedownmarkdownconverter.h \
    $$PWD/hoedown/hoedownmarkdownconverter_p.h

SOURCES += \
    $$PWD/hoedown/src/autolink.c \
    $$PWD/hoedown/src/buffer.c \
    $$PWD/hoedown/src/document.c \
    $$PWD/hoedown/src/escape.c \
    $$PWD/hoedown/src/html.c \
    $$PWD/hoedown/src/html_blocks.c \
    $$PWD/hoedown/src/html_smartypants.c \
    $$PWD/hoedown/src/stack.c \
    $$PWD/hoedown/src/version.c \
#    $$PWD/hoedown/bin/hoedown.c \
    $$PWD/hoedown/hoedownmarkdownconverter.cpp \



