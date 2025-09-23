# Documento de Diseño - Rediseño UI Estilo iOS

## Visión General

Este diseño transforma la aplicación Multitec UA para adoptar un estilo visual moderno y limpio, manteniendo la funcionalidad existente mientras mejora significativamente la experiencia de usuario. El rediseño se basa en principios de diseño modernos: simplicidad, claridad, profundidad y consistencia.

El diseño aprovecha completamente el sistema existente de colores (`context.colors`), tipografías (`context.textTheme`) y espaciados (`core/ui/styles/`), ampliando los temas existentes en `core/ui/theme/app_theme.dart` cuando sea necesario para lograr la estética deseada.

## Arquitectura

### Estructura de Componentes

```
lib/core/ui/components/
├── buttons/                     # Componentes de botones
│   └── mt_button.dart          # Botones con estilo personalizado
├── cards/                       # Componentes de cards
│   └── mt_card.dart            # Cards con estilo personalizado
├── inputs/                      # Componentes de entrada
│   └── mt_input_field.dart     # Campos de entrada personalizados
├── lists/                       # Componentes de listas
│   ├── mt_list_tile.dart       # Elementos de lista personalizados
│   └── section_header.dart     # Headers de sección
├── navigation/                  # Componentes de navegación
│   └── mt_navigation_bar.dart  # Barra de navegación personalizada
├── appbar/                      # Componentes existentes (actualizados)
├── dialogs/                     # Componentes existentes (actualizados)
├── modals/                      # Componentes existentes (actualizados)
└── snackbars/                   # Componentes existentes (actualizados)
```

### Principios de Diseño

1. **Claridad**: Uso de espacios en blanco generosos y jerarquía visual clara
2. **Profundidad**: Sombras sutiles y elevaciones para crear sensación de capas
3. **Simplicidad**: Interfaces limpias con elementos mínimos pero funcionales
4. **Consistencia**: Patrones de interacción uniformes en toda la aplicación

## Componentes y Interfaces

### 1. Sistema de Botones

#### Botón Primario
- **Estilo**: Fondo sólido con `context.colors.primaryBase`
- **Forma**: Border radius `AppBorderRadius.br12`
- **Padding**: `paddings.y.s16` y `paddings.x.s24`
- **Tipografía**: `context.textTheme.labelLarge` en color blanco
- **Estados**: Normal, pressed, disabled con opacidades apropiadas

#### Botón Secundario
- **Estilo**: Borde con `context.colors.primaryBase`, fondo transparente
- **Forma**: Border radius `AppBorderRadius.br12`
- **Padding**: `paddings.y.s16` y `paddings.x.s24`
- **Tipografía**: `context.textTheme.labelLarge` en `context.colors.primaryBase`

#### Botón Destructivo
- **Estilo**: Fondo sólido con `context.colors.error`
- **Forma**: Border radius `AppBorderRadius.br12`
- **Padding**: `paddings.y.s16` y `paddings.x.s24`
- **Tipografía**: `context.textTheme.labelLarge` en color blanco

### 2. Sistema de Cards

#### Card Principal
- **Fondo**: `context.colors.surface`
- **Forma**: Border radius `AppBorderRadius.br16`
- **Sombra**: Elevación sutil usando `context.colors.gray20` con opacidad
- **Padding**: `paddings.all.s16`
- **Separación**: `spacings.y.s12` entre cards

#### Card de Lista
- **Fondo**: `context.colors.surface`
- **Forma**: Border radius `AppBorderRadius.br12`
- **Separadores**: Líneas sutiles con `context.colors.gray20`
- **Padding**: `paddings.all.s12`

### 3. Sistema de Inputs

#### Campo de Texto
- **Fondo**: `context.colors.gray10`
- **Forma**: Border radius `AppBorderRadius.br10`
- **Padding**: `paddings.all.s16`
- **Tipografía**: `context.textTheme.bodyLarge`
- **Estados**: Normal, focused, error con colores apropiados
- **Placeholder**: `context.colors.textSecondary`

#### Campo con Label
- **Label**: `context.textTheme.labelMedium` en `context.colors.textSecondary`
- **Espaciado**: `spacings.y.s6` entre label e input

### 4. Sistema de Navegación

#### Navigation Bar
- **Fondo**: `context.colors.background` con efecto de transparencia
- **Altura**: Estándar (44pt + safe area)
- **Título**: `context.textTheme.headlineSmall` centrado
- **Botones**: Iconos con `context.colors.primaryBase`
- **Separador**: Línea sutil con `context.colors.gray20`

#### Tab Bar
- **Fondo**: `context.colors.surface` con efecto de transparencia
- **Iconos**: 24x24 con `context.colors.primaryBase` (activo) y `context.colors.textSecondary` (inactivo)
- **Indicador**: Sin labels, solo iconos
- **Separador**: Línea sutil superior

### 5. Sistema de Listas

#### List Tile
- **Fondo**: `context.colors.surface`
- **Padding**: `paddings.all.s16`
- **Separador**: Línea con `context.colors.gray20` y padding left
- **Título**: `context.textTheme.bodyLarge`
- **Subtítulo**: `context.textTheme.bodyMedium` en `context.colors.textSecondary`
- **Trailing**: Chevron con `context.colors.textSecondary`

#### Section Header
- **Fondo**: `context.colors.background`
- **Padding**: `paddings.x.s16` y `paddings.y.s8`
- **Tipografía**: `context.textTheme.labelMedium` en `context.colors.textSecondary`
- **Transformación**: Texto en mayúsculas

## Modelos de Datos

### Ampliación de Temas Existentes

Los temas `themeLight` y `themeDark` en `core/ui/theme/app_theme.dart` serán ampliados con configuraciones adicionales:

```dart
// Ampliaciones para themeLight
final themeLight = _baseTheme.copyWith(
  // ... configuraciones existentes ...
  
  // Nuevas configuraciones para componentes personalizados
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1.0,
      shadowColor: lightColors.gray20,
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
    ),
  ),
  
  cardTheme: CardTheme(
    elevation: 1.0,
    shadowColor: lightColors.gray20.withValues(alpha: 0.3),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
    color: lightColors.surface,
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightColors.gray10,
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide.none,
    ),
    contentPadding: paddings.all.s16,
  ),
);
```

### Configuración de Estilo
```dart
class MTStyleConfig {
  // Configuración de elevaciones
  static const double cardElevation = 1.0;
  static const double modalElevation = 8.0;
  
  // Configuración de opacidades
  static const double pressedOpacity = 0.6;
  static const double disabledOpacity = 0.3;
  static const double overlayOpacity = 0.1;
  
  // Configuración de duraciones de animación
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration normalAnimation = Duration(milliseconds: 250);
}
```

### Estados de Componentes
```dart
enum MTComponentState {
  normal,
  pressed,
  disabled,
  focused,
  error,
}
```

## Manejo de Errores

### Validación de Formularios
- **Estilo**: Bordes rojos con `context.colors.error`
- **Mensajes**: `context.textTheme.bodySmall` en `context.colors.error`
- **Iconos**: Iconos de error con `context.colors.error`

### Mensajes de Estado
- **Success**: Uso de `context.colors.success` con iconos apropiados
- **Warning**: Uso de `context.colors.warning` con iconos apropiados
- **Info**: Uso de `context.colors.info` con iconos apropiados

### Dialogs y Modals
- **Fondo**: `context.colors.surface`
- **Forma**: Border radius `AppBorderRadius.br16`
- **Sombra**: Elevación pronunciada
- **Botones**: Estilo personalizado con separadores sutiles

## Estrategia de Testing

### Pruebas de Componentes
- **Widget Tests**: Para cada componente personalizado creado
- **Golden Tests**: Para verificar consistencia visual
- **Interaction Tests**: Para estados de componentes

### Pruebas de Integración
- **Navigation Tests**: Verificar flujos de navegación
- **Theme Tests**: Verificar aplicación correcta de temas
- **Responsive Tests**: Verificar adaptabilidad a diferentes tamaños

### Pruebas de Accesibilidad
- **Semantic Tests**: Verificar etiquetas semánticas
- **Contrast Tests**: Verificar contraste de colores
- **Focus Tests**: Verificar navegación por teclado

## Implementación por Features

### Feature Auth
- **Sign In Screen**: Formulario centrado con inputs personalizados, botón primario, links secundarios
- **Widgets**: Formulario de login, campos de validación, botones de acción

### Feature Home
- **Home Screen**: Grid/lista de cards personalizados, navegación por tabs, header con logo
- **Widgets**: Cards de contenido, elementos de navegación, headers de sección

### Feature Profile
- **Profile Screen**: Lista de configuraciones con estilo personalizado, header con avatar, secciones agrupadas
- **Widgets**: Lista de opciones, headers de sección, elementos de configuración

### Feature Settings
- **Settings Screen**: Lista agrupada con estilo personalizado, switches y toggles, navegación jerárquica
- **Widgets**: Lista de configuraciones, elementos de toggle, navegación de detalle

### Features Adicionales (Map, Schedule, City Search)
- **Consistencia**: Aplicar mismos patrones de diseño personalizados
- **Componentes**: Reutilizar componentes creados
- **Navegación**: Mantener consistencia en patrones de navegación

## Decisiones de Diseño

### Colores
- **Justificación**: Usar sistema existente para mantener identidad de marca
- **Aplicación**: `context.colors` proporciona paleta completa y consistente
- **Contraste**: Colores existentes ya cumplen con estándares de accesibilidad

### Tipografía
- **Justificación**: Sistema existente ya define jerarquía clara
- **Aplicación**: `context.textTheme` proporciona escalas apropiadas
- **Legibilidad**: Tamaños y pesos ya optimizados para lectura

### Espaciados
- **Justificación**: Sistema existente permite flexibilidad y consistencia
- **Aplicación**: `spacings`, `paddings`, `borderRadius` cubren necesidades del diseño
- **Ampliación**: Se pueden añadir nuevos valores en `core/ui/styles/` si es necesario
- **Ritmo Visual**: Valores existentes crean ritmo visual apropiado

### Ampliación de Temas
- **Justificación**: Ampliar `themeLight` y `themeDark` para configuraciones específicas
- **Consistencia**: Mantener configuraciones centralizadas en el sistema de temas
- **Flexibilidad**: Permitir personalización sin romper la estructura existente

### Componentes Reutilizables
- **Justificación**: Crear biblioteca de componentes personalizados para consistencia
- **Mantenibilidad**: Componentes centralizados facilitan actualizaciones
- **Escalabilidad**: Base sólida para futuras features

## Consideraciones de Rendimiento

### Optimizaciones
- **Widget Rebuilds**: Minimizar reconstrucciones innecesarias
- **Memory Usage**: Reutilizar componentes y evitar duplicación
- **Animation Performance**: Usar animaciones nativas de Flutter optimizadas

### Lazy Loading
- **Listas**: Implementar lazy loading para listas largas
- **Imágenes**: Cargar imágenes bajo demanda
- **Navegación**: Cargar pantallas solo cuando sea necesario