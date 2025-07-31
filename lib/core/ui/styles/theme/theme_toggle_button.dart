import 'package:flutter/material.dart';
import 'package:sq1_assignment/core/ui/styles/theme/theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key, this.size = 24.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return IconButton(
      icon: Icon(
        theme.isLight ? Icons.dark_mode : Icons.light_mode,
        color: colors.secondary,
        size: size,
      ),
      onPressed: theme.toggle,
      tooltip: theme.isLight ? 'Switch to dark mode' : 'Switch to light mode',
    );
  }
}

/// A more stylized version of the theme toggle button with animation
class AnimatedThemeToggleButton extends StatelessWidget {
  const AnimatedThemeToggleButton({
    super.key,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 300),
  });

  final double size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return IconButton(
      icon: AnimatedSwitcher(
        duration: duration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          theme.isLight ? Icons.dark_mode : Icons.light_mode,
          key: ValueKey<bool>(theme.isLight),
          color: colors.secondary,
          size: size,
        ),
      ),
      onPressed: theme.toggle,
      tooltip: theme.isLight ? 'Switch to dark mode' : 'Switch to light mode',
    );
  }
}
