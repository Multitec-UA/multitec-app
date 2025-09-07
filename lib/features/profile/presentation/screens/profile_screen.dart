import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProfileCubit>(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MultitecAppBar(),
      body: BlocListener<ProfileCubit, ProfileState>(
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
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, profileState) {
            return Padding(
              padding: paddings.x.s16,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: profileState.status.isLoading
                      ? null
                      : () => context.read<ProfileCubit>().signOut(),
                  icon: profileState.status.isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.logout),
                  label: Text(
                    profileState.status.isLoading
                        ? 'Cerrando sesión...'
                        : 'Cerrar sesión',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Theme.of(context).colorScheme.onError,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
