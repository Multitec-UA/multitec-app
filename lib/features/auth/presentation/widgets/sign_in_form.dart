import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/dialogs/info_dialog.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
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
    //TODO: hacer borderradius mas redondo
    return Padding(
      padding: paddings.x.s32,
      child: SizedBox(
        width: double.infinity,
        child: MTButton(
          onPressed: isLoading
              ? null
              : () => context.read<SignInCubit>().signInWithGoogle(),
          isLoading: isLoading,
          text: context.l10n.signInWithGoogle,
        ),
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
      onPressed: isLoading
          ? null
          : () => showInfoDialog(
              context: context,
              content: context.l10n.signInHelpContent,
              actionButtonText: context.l10n.understood,
            ),
      child: Text(context.l10n.needHelpQuestion),
    );
  }
}
