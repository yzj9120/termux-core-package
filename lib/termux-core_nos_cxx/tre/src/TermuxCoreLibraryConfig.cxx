#include <stdbool.h>

#include <termux/termux_core__nos__cxx/v1/TermuxCoreLibraryConfig.h>

static bool sIsRunningTests = false;



bool libtermux_core__nos__cxx__getIsRunningTests() {
    return sIsRunningTests;
}

void libtermux_core__nos__cxx__setIsRunningTests(bool isRunningTests) {
    sIsRunningTests = isRunningTests;
}
