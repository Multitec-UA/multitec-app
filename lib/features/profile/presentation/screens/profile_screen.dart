import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/profile/presentation/widgets/widgets.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MultitecAppBar(
        action: MultitecAppBarAction.settingsShortcut,
      ),
      body: BlocSelector<UserCubit, UserState, User?>(
        selector: (state) => state.user,
        builder: (context, user) {
          return SingleChildScrollView(
            padding: paddings.all.s16,
            child: Column(
              children: [
                ProfileHeader(user: user),
                spacings.y.s8,
                const ProfileOptionsSection(),
                spacings.y.s24,
                const DeveloperSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
