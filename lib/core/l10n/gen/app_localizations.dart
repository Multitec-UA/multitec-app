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

  /// No description provided for @joinedSchedulesNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t fetch your events due to a connection error'**
  String get joinedSchedulesNetworkError;

  /// No description provided for @joinedSchedulesTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t fetch your events because it took too long'**
  String get joinedSchedulesTimeoutError;

  /// No description provided for @signInNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t sign in due to a connection error'**
  String get signInNetworkError;

  /// No description provided for @signInTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t sign in because it took too long'**
  String get signInTimeoutError;

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

  /// Join activity button text
  ///
  /// In en, this message translates to:
  /// **'Join Activity'**
  String get joinActivity;

  /// Leave activity button text
  ///
  /// In en, this message translates to:
  /// **'Leave Activity'**
  String get leaveActivity;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(Object name);

  /// Home section title for upcoming events and activities
  ///
  /// In en, this message translates to:
  /// **'Upcoming events and activities'**
  String get homeUpcomingSectionTitle;

  /// Home section title for quick actions
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get homeQuickActionsSectionTitle;

  /// AppBar title in joined schedules screen
  ///
  /// In en, this message translates to:
  /// **'My activities and events'**
  String get joinedSchedulesTitle;

  /// No description provided for @joinedSchedulesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t joined any event or activity'**
  String get joinedSchedulesEmptyTitle;

  /// No description provided for @joinedSchedulesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore available events and activities to join'**
  String get joinedSchedulesEmptySubtitle;

  /// No description provided for @listErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Load error'**
  String get listErrorTitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @scheduleEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No upcoming events'**
  String get scheduleEmptyTitle;

  /// No description provided for @scheduleEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Come back later to see new events and activities'**
  String get scheduleEmptySubtitle;

  /// No description provided for @scheduleLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load events'**
  String get scheduleLoadError;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// Lowercase 'events' label
  ///
  /// In en, this message translates to:
  /// **'events'**
  String get events;

  /// No description provided for @developerSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developerSectionTitle;

  /// No description provided for @developerClearDbTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear database'**
  String get developerClearDbTitle;

  /// No description provided for @developerClearDbSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete local data'**
  String get developerClearDbSubtitle;

  /// No description provided for @signInWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Multitec'**
  String get signInWelcomeTitle;

  /// No description provided for @signInWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access the Multitec UA community'**
  String get signInWelcomeDescription;

  /// No description provided for @domainRestrictionNotice.
  ///
  /// In en, this message translates to:
  /// **'@multitecua.com accounts only'**
  String get domainRestrictionNotice;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInHelpContent.
  ///
  /// In en, this message translates to:
  /// **'You must use a Google account with the @multitecua.com domain.\n\nIf you need access, contact your coordinator or support.'**
  String get signInHelpContent;

  /// No description provided for @understood.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get understood;

  /// No description provided for @needHelpQuestion.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get needHelpQuestion;

  /// No description provided for @reportSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Report sent successfully'**
  String get reportSentSuccess;

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending…'**
  String get sending;

  /// No description provided for @sendReport.
  ///
  /// In en, this message translates to:
  /// **'Send report'**
  String get sendReport;

  /// No description provided for @noItemsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No items available'**
  String get noItemsAvailable;

  /// No description provided for @eventDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventDetailsTitle;

  /// No description provided for @activityDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity Details'**
  String get activityDetailsTitle;

  /// No description provided for @eventInfoSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Information'**
  String get eventInfoSectionTitle;

  /// No description provided for @participationSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Participation'**
  String get participationSectionTitle;

  /// No description provided for @registeredPeople.
  ///
  /// In en, this message translates to:
  /// **'Registered people'**
  String get registeredPeople;

  /// Tab title for events in Schedule screen
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get scheduleTabEvents;

  /// Tab title for activities in Schedule screen
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get scheduleTabActivities;

  /// No description provided for @quickActionsEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get quickActionsEventsTitle;

  /// No description provided for @quickActionsEventsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See events'**
  String get quickActionsEventsSubtitle;

  /// No description provided for @quickActionsActivitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get quickActionsActivitiesTitle;

  /// No description provided for @quickActionsActivitiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See activities'**
  String get quickActionsActivitiesSubtitle;

  /// No description provided for @quickActionsSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'My saved'**
  String get quickActionsSavedTitle;

  /// No description provided for @quickActionsSavedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Saved events and activities'**
  String get quickActionsSavedSubtitle;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutDialogTitle;

  /// No description provided for @signOutDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutDialogContent;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutConfirm;

  /// No description provided for @privacyPolicyPrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing you accept our '**
  String get privacyPolicyPrefix;

  /// No description provided for @privacyPolicyLinkText.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get privacyPolicyLinkText;

  /// No description provided for @privacyPolicySuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get privacyPolicySuffix;

  /// No description provided for @privacyPolicyUrl.
  ///
  /// In en, this message translates to:
  /// **'https://www.google.com'**
  String get privacyPolicyUrl;

  /// No description provided for @loadMoreError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load more items'**
  String get loadMoreError;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @themeSystemTitle.
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get themeSystemTitle;

  /// No description provided for @themeSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow device settings'**
  String get themeSystemSubtitle;

  /// No description provided for @themeLightTitle.
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get themeLightTitle;

  /// No description provided for @helpAndFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Feedback'**
  String get helpAndFeedbackTitle;

  /// No description provided for @contactDeveloperTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact the developer'**
  String get contactDeveloperTitle;

  /// No description provided for @contactDeveloperSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Invite for a virtual coffee and get in touch'**
  String get contactDeveloperSubtitle;

  /// No description provided for @contactDeveloperEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'I invite you to a coffee'**
  String get contactDeveloperEmailSubject;

  /// No description provided for @contactDeveloperEmailBody.
  ///
  /// In en, this message translates to:
  /// **'Hello,\n\nI would like to invite you to a virtual coffee to chat about Multitec UA and get in touch.\n\nLooking forward to your response!\n\nBest, [ Your Name ]'**
  String get contactDeveloperEmailBody;

  /// No description provided for @reportBugTitle.
  ///
  /// In en, this message translates to:
  /// **'Report a bug / Suggest a feature'**
  String get reportBugTitle;

  /// No description provided for @reportBugSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send bug reports or request new features'**
  String get reportBugSubtitle;

  /// No description provided for @reportBugEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Bug report or feature request'**
  String get reportBugEmailSubject;

  /// No description provided for @reportBugEmailBody.
  ///
  /// In en, this message translates to:
  /// **'Hi,\n\nI found an issue in Multitec UA I\'d like to report. Here are the details:\n[Brief description of the bug or issue]\n\nDevice and OS version:\n[Device info and OS version]\n\nOr,\n\nI have an idea for a new feature that could be great for Multitec UA:\n[Feature description]\n\nThanks for your attention.\n\nBest, [ Your Name ]'**
  String get reportBugEmailBody;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsPreferencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get settingsPreferencesTitle;

  /// No description provided for @settingsHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelpTitle;

  /// No description provided for @settingsAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccountTitle;

  /// No description provided for @helpAndFeedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help and send feedback'**
  String get helpAndFeedbackSubtitle;

  /// No description provided for @profileMySchedulesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'My activities and events'**
  String get profileMySchedulesSectionTitle;

  /// No description provided for @profileMySchedulesTitle.
  ///
  /// In en, this message translates to:
  /// **'My activities and events'**
  String get profileMySchedulesTitle;

  /// No description provided for @profileMySchedulesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View saved'**
  String get profileMySchedulesSubtitle;

  /// No description provided for @profileSettingsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettingsSectionTitle;

  /// No description provided for @profileSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettingsTitle;

  /// No description provided for @profileSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme, language and more'**
  String get profileSettingsSubtitle;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;
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
