import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:multitec_app/core/ui/theme/theme_toggle_button.dart';

class MultitecAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MultitecAppBar({
    super.key,
    this.showLogo = true,
    this.actions,
  });

  final bool showLogo;
  final List<Widget>? actions;

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
      actions: actions ?? [const ThemeToggleButton()],
    );
  }
}
