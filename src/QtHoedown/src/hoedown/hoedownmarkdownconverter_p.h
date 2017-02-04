#ifndef HOEDOWNMARKDOWNCONVERTER_P_H
#define HOEDOWNMARKDOWNCONVERTER_P_H

#include <QString>
#include <QByteArray>


class HoedownMarkdownConverterPrivate
{
public:
    HoedownMarkdownConverterPrivate();
    QByteArray markdown2Html(const QByteArray &markdownText) const;

};

#endif // HOEDOWNMARKDOWNCONVERTER_P_H

