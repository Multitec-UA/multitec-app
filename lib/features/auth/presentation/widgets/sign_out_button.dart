import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/dialogs/confirmation_dialog.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_out_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_out_state.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(locator<SignOutUseCase>()),
      child: const _Button(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignOutCubit, SignOutState, bool>(
      selector: (state) => state.status.isLoading,
      builder: (context, isLoading) {
        return SizedBox(
          width: double.infinity,
          child: MTButton(
            type: MTButtonType.destructive,
            onPressed: isLoading
                ? null
                : () => _showSignOutConfirmationDialog(context),
            isLoading: isLoading,
            text: context.l10n.signOut,
          ),
        );
      },
    );
  }

  Future<void> _showSignOutConfirmationDialog(BuildContext context) async {
    await showConfirmationDialog(
      context: context,
      title: context.l10n.signOutDialogTitle,
      content: context.l10n.signOutDialogContent,
      confirmText: context.l10n.signOutConfirm,
      onConfirm: () => context.read<SignOutCubit>().signOut(),
    );
  }
}
