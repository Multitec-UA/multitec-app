import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/error_reporter.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/firebase_options.dart';

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
  FlutterError.onError = (details) {
    if (kDebugMode) FlutterError.presentError(details);
    ErrorReporter().report(
      details.exception,
      stackTrace: details.stack ?? StackTrace.current,
      hint: 'FlutterError',
      fatal: true,
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    ErrorReporter().report(
      error,
      stackTrace: stack,
      hint: 'PlatformDispatcher',
      fatal: true,
    );
    return true;
  };

  ErrorWidget.builder = errorBuilderWidget;

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (Platform.isIOS) {
        await ApiKeyChannel.provideKey(
          apiKey: GoogleMapsApiConfig.apiKey,
          method: GoogleMapsApiConfig.apiKeyChannelMethod,
        );
      }

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await serviceLocatorSetUp();
      await locator<AuthService>().initialize();

      runApp(await builder());
    },
    (error, stackTrace) {
      ErrorReporter().report(
        error,
        stackTrace: stackTrace,
        hint: 'ZoneGuarded',
        fatal: true,
      );
    },
  );
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
