import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/error_reporter.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    if (kDebugMode) FlutterError.presentError(details);
    //TODO: Ver si dejarlo asi o reportar el error aqui directamente
    Zone.current.handleUncaughtError(
      details.exception,
      details.stack ?? StackTrace.current,
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    //TODO: Ver si dejarlo asi o reportar el error aqui directamente
    Zone.current.handleUncaughtError(error, stack);
    return true;
  };

  ErrorWidget.builder = errorBuilderWidget;

  Bloc.observer = const AppBlocObserver();

  if (!kIsWeb && Platform.isIOS) {
    await ApiKeyProvider.provideGoogleMapsApiKey();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await serviceLocatorSetUp();

  await GetIt.I.isReady<SharedPreferences>().then((_) async {
    await runZonedGuarded(
      () async => runApp(await builder()),
      (error, stackTrace) {
        ErrorReporter().report(
          error,
          stackTrace: stackTrace,
          hint: 'zoneGuarded',
          fatal: true,
        );
      },
    );
  });
}

Widget errorBuilderWidget(FlutterErrorDetails details) {
  final text =
      kReleaseMode ? 'Se ha producido un error' : details.exception.toString();

  return Material(
    child: ColoredBox(
      color: Colors.grey,
      child: Padding(
        padding: paddings.all.s16,
        child: SingleChildScrollView(
          child: Text(text),
        ),
      ),
    ),
  );
}
