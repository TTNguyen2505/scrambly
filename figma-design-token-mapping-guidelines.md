# Figma Design Token Mapping and QML Architecture Guidelines

## 1. Mapping Figma Collections to QML Singleton Files

-   Map each Figma Collection to a dedicated QML Singleton file.
-   Convert the Collection name from Title Case to `PascalCase`. Use the
    resulting name for both the file and the Singleton type.
-   Clearly distinguish Collections that manage scalar values according
    to their role in the token architecture, using appropriate prefixes
    or naming conventions for the **Primitive** and **Semantic** layers.

## 2. Flattening Hierarchies and Naming Properties

-   All QML variable and property names must begin with a lowercase
    letter and follow `camelCase`.
-   Flatten Figma folder structures and hierarchical groups into a
    single identifier by concatenating the names of the parent group,
    child group, and variable in their original hierarchy order.
-   Remove all whitespace, slashes, hyphens, and other special
    characters. Capitalize the first letter of each subsequent word
    segment so that the resulting identifier follows `camelCase`.

## 3. Modeling Defined Styles as Composite Tokens

-   Group all Figma Defined Styles, including Text Styles and Effect
    Styles, into dedicated QML Singleton files intended specifically for
    composite styles.
-   Map each Defined Style to a `camelCase` property name formed by
    combining its group name with the specific Style name.
-   Represent each Style as an object template containing all
    constituent properties supported by Figma. Assign each field the
    corresponding native data type, such as string, integer,
    floating-point number, boolean, or color.
-   Declare all properties within each Style as open and extensible,
    ensuring that the model can capture the complete set of properties
    exposed by Figma, including hidden or additional properties.

## 4. Resolving Dependencies and Variable Bindings

-   Any Defined Style property that references a Figma Variable must be
    mapped to a direct binding to the corresponding Singleton in the
    Semantic or Primitive layer.
-   Any Defined Style property that contains a fixed value or is not
    linked to a Variable must be assigned the equivalent literal
    configuration value.
-   Enforce a strictly one-way dependency hierarchy:
    -   **Styles** depend on **Semantic** tokens.
    -   **Semantic** tokens depend on **Primitive** tokens.
    -   Reverse dependencies are not allowed.

## 5. Style Inheritance and Extension

-   When a standardized variant is reused across multiple locations,
    create it as an independent Style. Copy all properties from the base
    Style through the file's internal identifier, then override only the
    properties that need to change.
-   When an exception is specific to a single screen or local use case,
    override the relevant presentation properties directly at the UI
    component layer. Do not modify the original token values for such
    local exceptions.
