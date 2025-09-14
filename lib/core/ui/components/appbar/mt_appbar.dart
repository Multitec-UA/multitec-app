import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:multitec_app/core/ui/theme/theme_toggle_button.dart';

enum MultitecAppBarAction {
  none,
  profileShortcut,
  settingsShortcut,
  themeToggle
}

class MultitecAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MultitecAppBar({
    super.key,
    this.showLogo = true,
    this.actions,
    this.action = MultitecAppBarAction.themeToggle,
    this.bottom,
  });

  final bool showLogo;
  final List<Widget>? actions;
  final MultitecAppBarAction action;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: context.canPop()
          ? IconButton(
              onPressed: context.pop,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: context.colors.gray40,
              ),
            )
          : null,
      title: showLogo
          ? Semantics(
              label: 'Multitec',
              image: true,
              child: Image.asset(
                'assets/pngs/multitec_logo.png',
                height: 26,
                fit: BoxFit.contain,
              ),
            )
          : null,
      actions: actions ?? _buildActions(context),
      bottom: bottom,
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    switch (action) {
      case MultitecAppBarAction.none:
        return const [];
      case MultitecAppBarAction.themeToggle:
        return const [ThemeToggleButton()];
      case MultitecAppBarAction.profileShortcut:
        return [
          _AppBarActionButton(
            tooltip: 'Perfil',
            icon: Icons.person_rounded,
            onPressed: () => context.goNamed(AppRoute.profile.name),
          ),
        ];
      case MultitecAppBarAction.settingsShortcut:
        return [
          _AppBarActionButton(
            tooltip: 'Ajustes',
            icon: Icons.settings_rounded,
            onPressed: () => context.pushNamed(AppRoute.settings.name),
          ),
        ];
    }
  }
}

class _AppBarActionButton extends StatelessWidget {
  const _AppBarActionButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = context.colors.primaryBase;
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 16),
      child: Material(
        color: context.colors.primary10.withValues(alpha: 0.3),
        borderRadius: borderRadius.br12,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius.br12,
          child: Tooltip(
            message: tooltip,
            child: SizedBox(
              height: 36,
              width: 36,
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
