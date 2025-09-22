/// Configuration class for MT (Multitec) style constants
/// Contains elevations, opacities, and animation durations for consistent styling
class MTStyleConfig {
  // Private constructor to prevent instantiation
  MTStyleConfig._();

  // Elevation configurations
  static const double cardElevation = 1;
  static const double modalElevation = 8;
  static const double buttonElevation = 1;
  static const double appBarElevation = 0;
  static const double bottomNavElevation = 0;

  // Opacity configurations
  static const double pressedOpacity = 0.6;
  static const double disabledOpacity = 0.3;
  static const double overlayOpacity = 0.1;
  static const double shadowOpacity = 0.3;

  // Animation duration configurations
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration normalAnimation = Duration(milliseconds: 250);
  static const Duration slowAnimation = Duration(milliseconds: 350);

  // Component state configurations
  static const double focusedBorderWidth = 2;
  static const double normalBorderWidth = 1;
  static const double errorBorderWidth = 2;
}
