import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_state.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

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
          if (state.failure != null) {
            context.showSnackBar(
              AppSnackBar.error(
                content: Text(
                  state.failure.toLocalizedMessage(context),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: paddings.all.s24,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProfileHeader(user: state.user),
                    spacings.y.s32,
                    const _SettingsGroup(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacings.y.s16,
        _ProfileAvatar(photoUrl: user?.photoUrl),
        spacings.y.s16,
        _UserName(name: user?.name),
        spacings.y.s8,
        _EmailBadge(email: user?.email ?? ''),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.photoUrl});

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.primaryBase,
          width: 3,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: context.colors.background,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 45,
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
          child: photoUrl == null
              ? Icon(
                  Icons.person,
                  size: 45,
                  color: context.colors.gray20,
                )
              : null,
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? 'Usuario',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.primaryBase,
          ),
    );
  }
}

class _EmailBadge extends StatelessWidget {
  const _EmailBadge({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddings.x.s12 + paddings.y.s6,
      decoration: BoxDecoration(
        color: context.colors.gray20,
        borderRadius: borderRadius.br8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.email_outlined,
            size: 16,
            color: context.colors.gray40,
          ),
          spacings.x.s8,
          Text(
            email,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.colors.gray40,
                ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          icon: Icons.event_available,
          title: 'Mis eventos y actividades',
          subtitle: 'Ver',
          onTap: () => context.pushNamed(AppRoute.joinedSchedules.name),
        ),
        _SettingsTile(
          icon: Icons.language,
          title: 'Idioma',
          subtitle: 'Español',
          onTap: () {
            // TODO: Implement language change
          },
        ),
        spacings.y.s8,
        _SettingsTile(
          icon: Icons.palette_outlined,
          title: 'Tema',
          subtitle: 'Sistema',
          onTap: () {
            // TODO: Implement theme change
          },
        ),
        spacings.y.s8,
        _SettingsTile(
          icon: Icons.help_outline,
          title: 'Ayuda y Feedback',
          subtitle: 'Sistema',
          onTap: () {
            // TODO: Implement theme change
          },
        ),
        spacings.y.s16,
        const _SignOutButton(),
      ],
    );
  }
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: state.status.isLoading
                ? null
                : () => context.read<ProfileCubit>().signOut(),
            icon: state.status.isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.logout),
            label: Text(
              state.status.isLoading ? 'Cerrando sesión...' : 'Cerrar sesión',
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: context.colors.error,
              padding: paddings.y.s16,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius.br8,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius.br8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colors.gray20,
          ),
          borderRadius: borderRadius.br8,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: context.colors.gray40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: context.colors.gray30,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.colors.gray40,
            ),
          ],
        ),
      ),
    );
  }
}
