import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/theme/theme.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      defaultThemeMode: ThemeMode.light,
      child: Builder(
        builder: (context) {
          final appTheme = AppTheme.of(context);

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => locator<UserCubit>()),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: goRouter,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: themeLight,
              darkTheme: themeDark,
              themeMode: appTheme.isLight ? ThemeMode.light : ThemeMode.dark,
            ),
          );
        },
      ),
    );
  }
}
