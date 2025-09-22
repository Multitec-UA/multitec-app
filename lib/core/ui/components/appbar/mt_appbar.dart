import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

enum MultitecAppBarAction { none, profileShortcut, settingsShortcut }

class MultitecAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MultitecAppBar({
    super.key,
    this.showTitleLogo = true,
    this.title,
    this.action = MultitecAppBarAction.none,
  }) : assert(
         !showTitleLogo || title == null,
         'When showTitleLogo is true, title must be null',
       );

  final bool showTitleLogo;
  final String? title;
  final MultitecAppBarAction action;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        border: Border(
          bottom: BorderSide(
            color: context.colors.gray20.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
      ),
      child: AppBar(
        toolbarHeight: kToolbarHeight,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: context.canPop()
            ? _AppBarBackButton(onPressed: context.pop)
            : null,
        title: showTitleLogo
            ? Semantics(
                label: 'Multitec',
                image: true,
                child: Image.asset(
                  'assets/pngs/multitec_logo.png',
                  height: 26,
                  fit: BoxFit.contain,
                ),
              )
            : title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              )
            : null,
        actions: _buildActions(context),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    switch (action) {
      case MultitecAppBarAction.none:
        return const [];
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

class _AppBarBackButton extends StatelessWidget {
  const _AppBarBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: sizes.s16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius.br8,
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: context.colors.primaryBase,
            ),
          ),
        ),
      ),
    );
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
    return Padding(
      padding: EdgeInsets.only(left: sizes.s6, right: sizes.s16),
      child: Material(
        color: context.colors.primaryBase.withValues(alpha: 0.1),
        borderRadius: borderRadius.br10,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius.br10,
          child: Tooltip(
            message: tooltip,
            child: Container(
              height: 36,
              width: 36,
              alignment: Alignment.center,
              child: Icon(icon, size: 20, color: context.colors.primaryBase),
            ),
          ),
        ),
      ),
    );
  }
}
