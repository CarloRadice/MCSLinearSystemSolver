TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        windows_main.cpp

INCLUDEPATH += C:\Users\carloradice\Documents\MCSLinearSystemSolver\c++

win32:LIBS += -lpsapi
