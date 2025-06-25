
#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{
    
}

Backend::~Backend()
{
    for (CaffeeInfoPtr ptr : elemInfoList) 
        delete ptr;
}

void Backend::generateNumber(int min, int max)
{
    const int randomNum = QRandomGenerator::global()->bounded(min, max);
    emit numberEmitted(randomNum);
}

QList<CaffeeInfoPtr> Backend::generateDataModel()
{
    return elemInfoList;
}

