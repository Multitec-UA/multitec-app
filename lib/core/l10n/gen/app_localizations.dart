import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Home page title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get genericError;

  /// No description provided for @errorNetworkGeneric.
  ///
  /// In en, this message translates to:
  /// **'Connection error. Check your internet connection.'**
  String get errorNetworkGeneric;

  /// No description provided for @errorTimeoutGeneric.
  ///
  /// In en, this message translates to:
  /// **'The request timed out. Please try again.'**
  String get errorTimeoutGeneric;

  /// No description provided for @errorPermissionGeneric.
  ///
  /// In en, this message translates to:
  /// **'Permission denied.'**
  String get errorPermissionGeneric;

  /// No description provided for @errorLocationGeneric.
  ///
  /// In en, this message translates to:
  /// **'Location service is unavailable.'**
  String get errorLocationGeneric;

  /// No description provided for @errorAuthenticationGeneric.
  ///
  /// In en, this message translates to:
  /// **'There was an authentication problem.'**
  String get errorAuthenticationGeneric;

  /// No description provided for @errorEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use.'**
  String get errorEmailAlreadyInUse;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password is too weak.'**
  String get errorWeakPassword;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found.'**
  String get errorUserNotFound;

  /// No description provided for @errorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get errorWrongPassword;

  /// No description provided for @errorDomainNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Only accounts @multitecua.com can access.'**
  String get errorDomainNotAllowed;

  /// No description provided for @errorNetworkBadCertificate.
  ///
  /// In en, this message translates to:
  /// **'Secure connection failed (SSL certificate error).'**
  String get errorNetworkBadCertificate;

  /// No description provided for @errorHttp400BadRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request.'**
  String get errorHttp400BadRequest;

  /// No description provided for @errorHttp401Unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized.'**
  String get errorHttp401Unauthorized;

  /// No description provided for @errorHttp403Forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden.'**
  String get errorHttp403Forbidden;

  /// No description provided for @errorHttp404NotFound.
  ///
  /// In en, this message translates to:
  /// **'Resource not found.'**
  String get errorHttp404NotFound;

  /// No description provided for @errorHttp409Conflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict while processing the request.'**
  String get errorHttp409Conflict;

  /// No description provided for @errorHttp429TooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get errorHttp429TooManyRequests;

  /// No description provided for @errorHttp5xxServer.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorHttp5xxServer;

  /// Details section title
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Date label
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Location label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Attendees label
  ///
  /// In en, this message translates to:
  /// **'Attendees'**
  String get attendees;

  /// Join event button text
  ///
  /// In en, this message translates to:
  /// **'Join Event'**
  String get joinEvent;

  /// Leave event button text
  ///
  /// In en, this message translates to:
  /// **'Leave Event'**
  String get leaveEvent;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(Object name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
