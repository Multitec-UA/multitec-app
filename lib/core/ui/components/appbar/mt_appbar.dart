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
        leading: context.canPop() ? const _BackButton() : null,
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
          _ActionButton(
            icon: Icons.person_rounded,
            onPressed: () => context.goNamed(AppRoute.profile.name),
          ),
        ];
      case MultitecAppBarAction.settingsShortcut:
        return [
          _ActionButton(
            icon: Icons.settings_rounded,
            onPressed: () => context.pushNamed(AppRoute.settings.name),
          ),
        ];
    }
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.pop,
      padding: paddings.left.s16,
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 22,
        color: context.colors.primaryBase,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.right.s16,
      child: InkWell(
        onTap: onPressed,
        borderRadius: AppBorderRadius.br12,
        splashColor: context.colors.primaryBase.withValues(alpha: 0.1),
        highlightColor: context.colors.primaryBase.withValues(alpha: 0.05),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: AppBorderRadius.br12,
            border: Border.all(
              color: context.colors.gray20.withValues(alpha: 0.5),
            ),
          ),
          child: Icon(icon, size: 20, color: context.colors.textPrimary),
        ),
      ),
    );
  }
}
