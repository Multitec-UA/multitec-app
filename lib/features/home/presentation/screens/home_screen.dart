import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/home/presentation/widgets/quick_actions_section.dart';
import 'package:multitec_app/features/home/presentation/widgets/welcome_section.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_carousel.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select<UserCubit, UserState>((c) => c.state).user;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const MultitecAppBar(
        action: MultitecAppBarAction.profileShortcut,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeSection(userName: user?.name ?? 'Multitec'),

            spacings.y.s8,

            const SectionHeader(title: 'Próximos eventos y actividades'),
            const ScheduleCarousel(),

            spacings.y.s16,

            const SectionHeader(title: 'Acciones rápidas'),
            const QuickActionsSection(),
            spacings.y.s32,
          ],
        ),
      ),
    );
  }
}
