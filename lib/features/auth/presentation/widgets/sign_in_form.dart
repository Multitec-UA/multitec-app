import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/dialogs/info_dialog.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<SignInCubit, bool>(
      (c) => c.state.status.isLoading,
    );

    return Column(
      children: [
        _GoogleSignInButton(isLoading: isLoading),
        spacings.y.s16,
        _HelpButton(isLoading: isLoading),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.x.s32,
      child: MTButton(
        fullWidth: true,
        onPressed: isLoading
            ? null
            : () => context.read<SignInCubit>().signInWithGoogle(),
        isLoading: isLoading,
        text: 'Iniciar sesión con Google',
      ),
    );
  }
}

class _HelpButton extends StatelessWidget {
  const _HelpButton({required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : () => _showHelpDialog(context),
      child: const Text('¿Necesitas ayuda?'),
    );
  }

  //TODO: Sacar a dialog comun
  void _showHelpDialog(BuildContext context) {
    showInfoDialog(
      context: context,
      content:
          'Debes usar una cuenta de Google con el dominio @multitecua.com.\n\nSi necesitas acceso, contacta con tu coordinador o soporte.',
      actionButtonText: 'Entendido',
    );
  }
}
