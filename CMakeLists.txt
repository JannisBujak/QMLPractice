cmake_minimum_required(VERSION 3.16)

project(Kaffeemaschine VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appKaffeemaschine
    main.cpp
)

qt_add_qml_module(appKaffeemaschine
    URI Kaffeemaschine
    VERSION 1.0
    QML_FILES
    Main.qml CoffeeContent.qml Sidebar.qml
    SOURCES CoffeeInfo.h CoffeeInfo.cpp Backend.h Backend.cpp
    )

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appKaffeemaschine PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appKaffeemaschine
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appKaffeemaschine
    PRIVATE Qt6::Quick Qt6::Core
)

include(GNUInstallDirs)
install(TARGETS appKaffeemaschine
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
