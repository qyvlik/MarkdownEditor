#include "hoedownmarkdownconverter.h"
#include "hoedownmarkdownconverter_p.h"


#ifdef __cplusplus
extern "C" {
#endif

#include "document.h"
#include "html.h"

#ifdef __cplusplus
}
#endif

HoedownMarkdownConverter::HoedownMarkdownConverter(QObject *parent) :
    QObject(parent),
    d_ptr(new HoedownMarkdownConverterPrivate)
{

}

HoedownMarkdownConverter::~HoedownMarkdownConverter()
{
    delete d_ptr;
}

QString HoedownMarkdownConverter::markdown2html(const QString &mdText)
{
    return QString(d_ptr->markdown2Html(mdText.toUtf8()));
}

///-----------------------------HoedownMarkdownConverterPrivate-----------------------------------

HoedownMarkdownConverterPrivate::HoedownMarkdownConverterPrivate()
{}

QByteArray HoedownMarkdownConverterPrivate::markdown2Html(const QByteArray &markdownText) const {

    int markdownLength = markdownText.size();

    if(markdownLength == 0) {
        return QByteArray("");
    }

    hoedown_buffer *ib, *ob;
    hoedown_renderer *renderer = NULL;
    hoedown_document *document;

    // malloc
    ob = hoedown_buffer_new(markdownLength);
    ib = hoedown_buffer_new(markdownLength);
    renderer = hoedown_html_renderer_new(HOEDOWN_HTML_USE_XHTML, 0);

/*
typedef enum hoedown_extensions {
    // block-level extensions
    HOEDOWN_EXT_TABLES = (1 << 0),
    HOEDOWN_EXT_FENCED_CODE = (1 << 1),
    HOEDOWN_EXT_FOOTNOTES = (1 << 2),

    // span-level extensions
    HOEDOWN_EXT_AUTOLINK = (1 << 3),
    HOEDOWN_EXT_STRIKETHROUGH = (1 << 4),
    HOEDOWN_EXT_UNDERLINE = (1 << 5),
    HOEDOWN_EXT_HIGHLIGHT = (1 << 6),
    HOEDOWN_EXT_QUOTE = (1 << 7),
    HOEDOWN_EXT_SUPERSCRIPT = (1 << 8),
    HOEDOWN_EXT_MATH = (1 << 9),

    // other flags
    HOEDOWN_EXT_NO_INTRA_EMPHASIS = (1 << 11),
    HOEDOWN_EXT_SPACE_HEADERS = (1 << 12),
    HOEDOWN_EXT_MATH_EXPLICIT = (1 << 13),

    // negative flags
    HOEDOWN_EXT_DISABLE_INDENTED_CODE = (1 << 14)
} hoedown_extensions;
*/
    // 尽可能的指定
    document = hoedown_document_new(renderer, HOEDOWN_EXT_TABLES, 16);

    // put data
    hoedown_buffer_put(ib, (const uint8_t *) markdownText.toStdString().c_str(), markdownText.size());

    // render markdown to html
    hoedown_document_render(document, ob, ib->data, ib->size);

    QByteArray html((const char*)ob->data, ob->size);

    // free
    hoedown_buffer_free(ib);
    hoedown_document_free(document);
    hoedown_html_renderer_free(renderer);
    hoedown_buffer_free(ob);

    return html;
}

