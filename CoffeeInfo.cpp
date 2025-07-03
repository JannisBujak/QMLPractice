#include "CoffeeInfo.h"

CoffeeInfo::CoffeeInfo(QString name, QString colorNormal, QString colorHovered, QObject* parent)
    : name(name), colorNormal(colorNormal), colorHovered(colorHovered), QObject(parent)
{}

CoffeeInfo::CoffeeInfo(const CoffeeInfo& ei)
        : QObject(ei.parent()), name(ei.name), colorNormal(ei.colorNormal), colorHovered(ei.colorHovered)
{}

