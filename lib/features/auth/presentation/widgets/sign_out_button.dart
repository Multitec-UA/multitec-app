import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
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
            variant: MTButtonVariant.destructive,
            onPressed: isLoading ? null : () => _showSignOutDialog(context),
            isLoading: isLoading,
            text: 'Cerrar sesión',
          ),
        );
      },
    );
  }

  //TODO: Sacar a dialog comun
  void _showSignOutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('¿Estás seguro de que quieres cerrar sesión?'),
            spacings.y.s20,
            Row(
              children: [
                Expanded(
                  child: MTButton(
                    variant: MTButtonVariant.secondary,
                    onPressed: context.pop,
                    text: 'Cancelar',
                  ),
                ),
                spacings.x.s12,
                Expanded(
                  child: MTButton(
                    variant: MTButtonVariant.destructive,
                    onPressed: () {
                      context.pop();
                      context.read<SignOutCubit>().signOut();
                    },
                    text: 'Salir',
                  ),
                ),
              ],
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
