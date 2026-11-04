cmake_minimum_required(VERSION 3.16)

project(Scrambly VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick QuickEffects Svg)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_QML_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/qml")

add_subdirectory(src)

qt_add_executable(appScrambly
    src/main.cpp
)

if(WIN32)
    file(TO_CMAKE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/assets/images/scrambly_logo.ico" SCRAMBLY_ICON_PATH)
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/assets/images/scrambly_icon.rc.in"
        "${CMAKE_CURRENT_BINARY_DIR}/scrambly_icon.rc"
        @ONLY
    )
    target_sources(appScrambly PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/scrambly_icon.rc")
endif()

qt_add_resources(appScrambly "assets"
    PREFIX "/"
    FILES
        assets/audio/hover_effect.mp3
        assets/fonts/space_grotesk_bold.ttf
        assets/fonts/space_grotesk_medium.ttf
        assets/fonts/space_grotesk_regular.ttf
        assets/fonts/space_mono_bold.ttf
        assets/fonts/space_mono_regular.ttf
        assets/images/scrambly_logo.svg
        assets/images/icons/ic_account.svg
        assets/images/icons/ic_arrow_back.svg
        assets/images/icons/ic_arrow_forward.svg
        assets/images/icons/ic_bolt.svg
        assets/images/icons/ic_check.svg
        assets/images/icons/ic_crown.svg
        assets/images/icons/ic_exit.svg
        assets/images/icons/ic_help.svg
        assets/images/icons/ic_lock.svg
        assets/images/icons/ic_play.svg
        assets/images/icons/ic_replay.svg
        assets/images/icons/ic_score.svg
        assets/images/icons/ic_settings.svg
        assets/images/icons/ic_success.svg
        assets/images/icons/ic_trophy.svg
)

set_target_properties(appScrambly PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appScrambly
    PRIVATE
        Scramblyplugin
        coreplugin
        design_systemplugin
        Qt6::Quick
        Qt6::Svg
)

include(GNUInstallDirs)
install(TARGETS appScrambly
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
