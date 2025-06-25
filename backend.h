
#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QtQml>
#include <QSharedPointer>
#include <QColor>

class CaffeeInfo : public QObject{
    Q_OBJECT 
    QML_ELEMENT
    Q_PROPERTY(QString name MEMBER name)
    Q_PROPERTY(QString bgColorNorm MEMBER colorNormal)
    Q_PROPERTY(QString bgColorHover MEMBER colorHovered)

public:
    explicit CaffeeInfo(QString name, QString colorNormal, QString colorHovered, QObject* parent = nullptr)
        : name(name), colorNormal(colorNormal), colorHovered(colorHovered), QObject(parent)
    {}

    explicit CaffeeInfo(const CaffeeInfo& ei)
        : QObject(ei.parent()), name(ei.name), colorNormal(ei.colorNormal), colorHovered(ei.colorHovered) {}
    

    QString getName() {return name;}
    QString getColorNormal(){return colorNormal;};
    QString getColorHovered(){return colorHovered;};

private:
    QString name;
    QString colorNormal;
    QString colorHovered;
};

using CaffeeInfoPtr = CaffeeInfo*;

class Backend : public QObject {
    Q_OBJECT
    QML_ELEMENT

public:  
    explicit Backend(QObject* parent = nullptr);
    
    ~Backend();

    Q_INVOKABLE void generateNumber(int min, int max);

    Q_INVOKABLE QList<CaffeeInfoPtr> generateDataModel();

signals: 
    void numberEmitted(int num);

private:
    const QList<CaffeeInfo*> elemInfoList = {
        new CaffeeInfo("A", "#00a8ff", "#0097e6"),
        new CaffeeInfo("B", "#9c88ff", "#8c7ae6"), 
        new CaffeeInfo("C", "#fbc531", "#e1b12c"), 
        new CaffeeInfo("D", "#4cd137", "#44bd32"),
        new CaffeeInfo("E", "#487eb0", "#40739e")
    };

};


#endif // BACKEND_H


