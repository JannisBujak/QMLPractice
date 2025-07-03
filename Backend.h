
#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QSharedPointer>
#include <QColor>
#include "CoffeeInfo.h"

class Backend : public QObject {
    Q_OBJECT
    QML_ELEMENT

public:  
    explicit Backend(QObject* parent = nullptr);
    
    ~Backend();

    Q_INVOKABLE void setDataModel(QString aCoffeeName);

    Q_INVOKABLE QList<CoffeeInfoPtr> generateDataModel();

signals: 
    void dataModelSelected(CoffeeInfoPtr aCoffeeInfoPtr);

private:
    const QList<CoffeeInfo*> elemInfoList = {
        new CoffeeInfo("A", "#00a8ff", "#0097e6"),
        new CoffeeInfo("B", "#9c88ff", "#8c7ae6"), 
        new CoffeeInfo("C", "#fbc531", "#e1b12c"), 
        new CoffeeInfo("D", "#4cd137", "#44bd32"),
        new CoffeeInfo("E", "#487eb0", "#40739e")
    };

};


#endif // BACKEND_H


