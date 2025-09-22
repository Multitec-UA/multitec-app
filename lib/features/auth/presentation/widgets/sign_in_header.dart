import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Logo(),
        spacings.y.s32,
        _WelcomeTitle(),
        spacings.y.s12,
        _WelcomeDescription(),
        spacings.y.s24,
        const _DomainNotice(),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar tamaño del logo en esta screen
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pngs/multitec_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Bienvenido a Multitec',
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _WelcomeDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Inicia sesión para acceder a la comunidad de Multitec UA',
      textAlign: TextAlign.center,
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }
}

class _DomainNotice extends StatelessWidget {
  const _DomainNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddings.x.s16 + paddings.y.s8,
      decoration: BoxDecoration(
        color: context.colors.gray10,
        borderRadius: borderRadius.br10,
      ),
      child: Text(
        'Solo cuentas @multitecua.com',
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
