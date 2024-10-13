cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

set(PROJECT jcsecurlogon)
project(${PROJECT})

add_compile_definitions(JCSECURLOGON ON)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "-Wno-deprecated")
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 CONFIG REQUIRED COMPONENTS Core Gui Quick Qml QuickControls2)

set(SOURCES ${SOURCES}
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

qt_add_resources(QML_FILES ${QML_FILES}
    qml/qml.qrc
)

qt_add_resources(IMAGES ${IMAGES}
    images/images.qrc
)

add_executable(${PROJECT} ${SOURCES} ${QML_FILES} ${IMAGES})

target_link_libraries(${PROJECT} PUBLIC Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml Qt6::QuickControls2 ${CMAKE_THREAD_LIBS_INIT} ${LIBS})
