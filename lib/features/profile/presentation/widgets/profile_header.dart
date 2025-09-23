import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.user, super.key});

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
        spacings.y.s24,
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
        border: Border.all(color: context.colors.primaryBase, width: 3),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colors.background, width: 2),
        ),
        child: CircleAvatar(
          radius: 45,
          backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
          child: photoUrl == null
              ? Icon(Icons.person, size: 45, color: context.colors.gray20)
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
      style: context.textTheme.headlineSmall?.copyWith(
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
        borderRadius: AppBorderRadius.br8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.email_outlined, size: 16, color: context.colors.gray40),
          spacings.x.s8,
          Text(
            email,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.gray40,
            ),
          ),
        ],
      ),
    );
  }
}
