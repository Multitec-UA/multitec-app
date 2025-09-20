import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/ui/components/dialogs/info_dialog.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_state.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignInCubit(
          locator<SignInWithGoogleUseCase>(),
        ),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.isError) {
          context.showSnackBar(
            AppSnackBar.error(
              content: Text(
                state.failure.toLocalizedMessage(context),
              ),
            ),
          );
        }
      },
      child: Center(
        child: SingleChildScrollView(
          padding: paddings.x.s48,
          child: const _SignInContent(),
        ),
      ),
    );
  }
}

class _SignInContent extends StatelessWidget {
  const _SignInContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isLoading =
        context.select<SignInCubit, bool>((c) => c.state.status.isLoading);

    return Column(
      children: [
        const _Logo(),
        spacings.y.s24,
        Text(
          'Bienvenido a Multitec',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        spacings.y.s8,
        Text(
          'Inicia sesión para acceder a la comunidad de Multitec UA',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        spacings.y.s16,
        Align(
          child: Container(
            padding: paddings.x.s12 + paddings.y.s6,
            decoration: BoxDecoration(
              color: context.colors.gray20,
              borderRadius: borderRadius.br8,
            ),
            child: Text(
              'Solo cuentas @multitecua.com',
              style: theme.textTheme.labelLarge?.copyWith(
                color: context.colors.gray40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        spacings.y.s24,
        const _GoogleSignInButton(),
        spacings.y.s12,
        TextButton(
          onPressed: isLoading
              ? null
              : () {
                  showInfoDialog(
                    context: context,
                    content:
                        'Debes usar una cuenta de Google con el dominio @multitecua.com.\n\nSi necesitas acceso, contacta con tu coordinador o soporte.',
                    actionButtonText: 'Entendido',
                  );
                },
          child: const Text('¿Necesitas ayuda?'),
        ),
        spacings.y.s8,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Al continuar aceptas nuestras condiciones y la ',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              TextSpan(
                text: 'política de privacidad',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: context.colors.primaryBase,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final uri = Uri.parse(
                      'https://www.google.com',
                    );
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
              ),
              TextSpan(
                text: '.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
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

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select<SignInCubit, bool>((c) => c.state.status.isLoading);

    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () => context.read<SignInCubit>().signInWithGoogle(),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primaryBase,
          foregroundColor: context.colors.background,
          shape: RoundedRectangleBorder(borderRadius: borderRadius.br24),
          padding: paddings.x.s16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              const Icon(Icons.login),
            spacings.x.s12,
            Flexible(
              child: Text(
                isLoading ? 'Iniciando sesión...' : 'Iniciar sesión con Google',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
