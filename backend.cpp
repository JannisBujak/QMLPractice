
#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

Backend::~Backend()
{
    for (CoffeeInfoPtr ptr : elemInfoList) 
        delete ptr;
}

void Backend::setDataModel(QString aCoffeeName) {
    for (const CoffeeInfoPtr& coffee : elemInfoList) {
        if (coffee->getName() == aCoffeeName) {
            emit dataModelSelected(coffee); 
        }        
    }    
}


QList<CoffeeInfoPtr> Backend::generateDataModel()
{
    return elemInfoList;
}

