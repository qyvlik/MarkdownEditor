#ifndef HOEDOWNMARKDOWNCONVERTER_H
#define HOEDOWNMARKDOWNCONVERTER_H

#include <QObject>

class HoedownMarkdownConverterPrivate;
class HoedownMarkdownConverter : public QObject
{
    Q_OBJECT
public:
    explicit HoedownMarkdownConverter(QObject *parent = 0);
    ~HoedownMarkdownConverter();

    Q_INVOKABLE QString markdown2html(const QString& mdText);

signals:

public slots:
private:
    HoedownMarkdownConverterPrivate* d_ptr;
};

#endif // HOEDOWNMARKDOWNCONVERTER_H
