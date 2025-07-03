
#ifndef COFFEEINFO_H
#define COFFEEINFO_H

#include <QObject>
#include <QtQml>
#include <QSharedPointer>
#include <QColor>


class CoffeeInfo : public QObject {
    Q_OBJECT 
    QML_ELEMENT

    Q_PROPERTY(QString name MEMBER name READ getName NOTIFY nameChanged)
    Q_PROPERTY(QString bgColorNorm MEMBER colorNormal READ getColorNormal NOTIFY colorNormalChanged)
    Q_PROPERTY(QString bgColorHover MEMBER colorHovered READ getColorHovered NOTIFY colorHoverChanged)

public:
    CoffeeInfo() = default;
    explicit CoffeeInfo(QString name, QString colorNormal, QString colorHovered, QObject* parent = nullptr);

    explicit CoffeeInfo(const CoffeeInfo& ei);   

    QString getName() {return name;}
    QString getColorNormal(){return colorNormal;};
    QString getColorHovered(){return colorHovered;};

private:
    QString name;
    QString colorNormal;
    QString colorHovered;


signals:
    void nameChanged();
    void colorNormalChanged();
    void colorHoverChanged();
};

using CoffeeInfoPtr = CoffeeInfo*;

#endif // COFFEEINFO
