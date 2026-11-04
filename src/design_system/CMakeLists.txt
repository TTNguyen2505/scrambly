qt_add_library(design_system STATIC)

set(design_system_singletons
    tokens/PrimitiveSizes.qml
    tokens/SemanticSizes.qml
    tokens/PrimitiveBorderWidth.qml
    tokens/PrimitiveColors.qml
    tokens/SemanticColors.qml
    tokens/PrimitiveDepth.qml
    tokens/SemanticBorderWidth.qml
    tokens/PrimitiveTypography.qml
    tokens/PrimitiveBlur.qml
    tokens/EffectStyles.qml
    tokens/TextStyles.qml
    tokens/MotionTokens.qml
)

set_source_files_properties(${design_system_singletons} PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(design_system
    URI Scrambly.DesignSystem
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        ${design_system_singletons}
        components/AppText.qml
        components/Button.qml
        components/IconButton.qml
        components/TextButton.qml
        components/ProgressBar.qml
        components/ElevationEffect.qml
        components/Surface.qml
)

# Tự động tách các file Preview ra khỏi bản build Release
set(design_system_preview_files
    previews/AppTextPreview.qml
    previews/ButtonPreview.qml
    previews/IconButtonPreview.qml
    previews/TextButtonPreview.qml
    previews/ProgressBarPreview.qml
    previews/ElevationPreview.qml
)

if(NOT CMAKE_BUILD_TYPE STREQUAL "Release")
    qt_target_qml_sources(design_system
        QML_FILES
            ${design_system_preview_files}
    )
endif()

target_link_libraries(design_system
    PRIVATE
        Qt6::Quick
        Qt6::QuickEffects
)
