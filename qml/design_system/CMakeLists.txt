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
        ExamplePrimitiveTokens.qml
        ExampleSemanticTokens.qml
        components/ExampleComponent.qml
)

target_link_libraries(design_system
    PRIVATE
        Qt6::Quick
)
