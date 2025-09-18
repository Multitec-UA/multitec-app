import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/theme/theme.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:multitec_app/features/app_settings/presentation/cubits/locale_cubit.dart';
import 'package:multitec_app/features/app_settings/presentation/cubits/theme_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<UserCubit>()),
        BlocProvider(create: (_) => locator<ThemeCubit>()..init()),
        BlocProvider(create: (_) => locator<LocaleCubit>()..init()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select((ThemeCubit c) => c.state);
    final locale = context.select((LocaleCubit c) => c.state);

    return AppThemeProvider(
      themeMode: themeMode,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale, // null => sistema
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: themeMode,
      ),
    );
  }
}
