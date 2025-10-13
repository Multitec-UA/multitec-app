// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get genericError => 'Something went wrong.';

  @override
  String get errorNetworkGeneric =>
      'Connection error. Check your internet connection.';

  @override
  String get errorTimeoutGeneric => 'The request timed out. Please try again.';

  @override
  String get errorPermissionGeneric => 'Permission denied.';

  @override
  String get errorLocationGeneric => 'Location service is unavailable.';

  @override
  String get errorAuthenticationGeneric =>
      'There was an authentication problem.';

  @override
  String get errorEmailAlreadyInUse => 'Email is already in use.';

  @override
  String get errorInvalidCredentials => 'Invalid credentials.';

  @override
  String get errorWeakPassword => 'The password is too weak.';

  @override
  String get errorUserNotFound => 'User not found.';

  @override
  String get errorWrongPassword => 'Incorrect password.';

  @override
  String get errorDomainNotAllowed =>
      'Only accounts @multitecua.com can access.';

  @override
  String get errorNetworkBadCertificate =>
      'Secure connection failed (SSL certificate error).';

  @override
  String get errorHttp400BadRequest => 'Bad request.';

  @override
  String get errorHttp401Unauthorized => 'Unauthorized.';

  @override
  String get errorHttp403Forbidden => 'Forbidden.';

  @override
  String get errorHttp404NotFound => 'Resource not found.';

  @override
  String get errorHttp409Conflict => 'Conflict while processing the request.';

  @override
  String get errorHttp429TooManyRequests =>
      'Too many requests. Please try again later.';

  @override
  String get errorHttp5xxServer => 'Server error. Please try again later.';

  @override
  String get exampleListNetworkError =>
      'Couldn\'t fetch the list due to a connection error';

  @override
  String get exampleListTimeoutError =>
      'Couldn\'t fetch the list because it took too long';

  @override
  String get joinedSchedulesNetworkError =>
      'Couldn\'t fetch your events due to a connection error';

  @override
  String get joinedSchedulesTimeoutError =>
      'Couldn\'t fetch your events because it took too long';

  @override
  String get signInNetworkError =>
      'Couldn\'t sign in due to a connection error';

  @override
  String get signInTimeoutError => 'Couldn\'t sign in because it took too long';

  @override
  String get details => 'Details';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get location => 'Location';

  @override
  String get attendees => 'Attendees';

  @override
  String get joinEvent => 'Join Event';

  @override
  String get leaveEvent => 'Leave Event';

  @override
  String get joinActivity => 'Join Activity';

  @override
  String get leaveActivity => 'Leave Activity';

  @override
  String welcomeUser(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get homeUpcomingSectionTitle => 'Upcoming events and activities';

  @override
  String get homeQuickActionsSectionTitle => 'Quick actions';

  @override
  String get joinedSchedulesTitle => 'My activities and events';

  @override
  String get joinedSchedulesEmptyTitle =>
      'You haven\'t joined any event or activity';

  @override
  String get joinedSchedulesEmptySubtitle =>
      'Explore available events and activities to join';

  @override
  String get listErrorTitle => 'Load error';

  @override
  String get retry => 'Retry';

  @override
  String get scheduleEmptyTitle => 'No upcoming events';

  @override
  String get scheduleEmptySubtitle =>
      'Come back later to see new events and activities';

  @override
  String get scheduleLoadError => 'Failed to load events';

  @override
  String get seeMore => 'See more';

  @override
  String get events => 'events';

  @override
  String get developerSectionTitle => 'Developer';

  @override
  String get developerClearDbTitle => 'Clear database';

  @override
  String get developerClearDbSubtitle => 'Delete local data';

  @override
  String get signInWelcomeTitle => 'Welcome to Multitec';

  @override
  String get signInWelcomeDescription =>
      'Sign in to access the Multitec UA community';

  @override
  String get domainRestrictionNotice => '@multitecua.com accounts only';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInHelpContent =>
      'You must use a Google account with the @multitecua.com domain.\n\nIf you need access, contact your coordinator or support.';

  @override
  String get understood => 'Got it';

  @override
  String get needHelpQuestion => 'Need help?';

  @override
  String get reportSentSuccess => 'Report sent successfully';

  @override
  String get sending => 'Sending…';

  @override
  String get sendReport => 'Send report';

  @override
  String get noItemsAvailable => 'No items available';

  @override
  String get eventDetailsTitle => 'Event Details';

  @override
  String get activityDetailsTitle => 'Activity Details';

  @override
  String get eventInfoSectionTitle => 'Event Information';

  @override
  String get participationSectionTitle => 'Participation';

  @override
  String get registeredPeople => 'Registered people';

  @override
  String get scheduleTabEvents => 'Events';

  @override
  String get scheduleTabActivities => 'Activities';

  @override
  String get quickActionsEventsTitle => 'Events';

  @override
  String get quickActionsEventsSubtitle => 'See events';

  @override
  String get quickActionsActivitiesTitle => 'Activities';

  @override
  String get quickActionsActivitiesSubtitle => 'See activities';

  @override
  String get quickActionsSavedTitle => 'My saved';

  @override
  String get quickActionsSavedSubtitle => 'Saved events and activities';

  @override
  String get quickActionsExampleTitle => 'Feature Example';

  @override
  String get quickActionsExampleSubtitle => 'Go to Feature Example';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutDialogTitle => 'Sign out';

  @override
  String get signOutDialogContent => 'Are you sure you want to sign out?';

  @override
  String get signOutConfirm => 'Sign out';

  @override
  String get privacyPolicyPrefix => 'By continuing you accept our ';

  @override
  String get privacyPolicyLinkText => 'privacy policy';

  @override
  String get privacyPolicySuffix => '.';

  @override
  String get privacyPolicyUrl => 'https://www.google.com';

  @override
  String get loadMoreError => 'Failed to load more items';

  @override
  String get languageTitle => 'Language';

  @override
  String get themeSystemTitle => 'System theme';

  @override
  String get themeSystemSubtitle => 'Follow device settings';

  @override
  String get themeLightTitle => 'Light theme';

  @override
  String get helpAndFeedbackTitle => 'Help & Feedback';

  @override
  String get contactDeveloperTitle => 'Contact the developer';

  @override
  String get contactDeveloperSubtitle =>
      'Invite for a virtual coffee and get in touch';

  @override
  String get contactDeveloperEmailSubject => 'I invite you to a coffee';

  @override
  String get contactDeveloperEmailBody =>
      'Hello,\n\nI would like to invite you to a virtual coffee to chat about Multitec UA and get in touch.\n\nLooking forward to your response!\n\nBest, [ Your Name ]';

  @override
  String get reportBugTitle => 'Report a bug / Suggest a feature';

  @override
  String get reportBugSubtitle => 'Send bug reports or request new features';

  @override
  String get reportBugEmailSubject => 'Bug report or feature request';

  @override
  String get reportBugEmailBody =>
      'Hi,\n\nI found an issue in Multitec UA I\'d like to report. Here are the details:\n[Brief description of the bug or issue]\n\nDevice and OS version:\n[Device info and OS version]\n\nOr,\n\nI have an idea for a new feature that could be great for Multitec UA:\n[Feature description]\n\nThanks for your attention.\n\nBest, [ Your Name ]';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsPreferencesTitle => 'Preferences';

  @override
  String get settingsHelpTitle => 'Help';

  @override
  String get settingsAccountTitle => 'Account';

  @override
  String get helpAndFeedbackSubtitle => 'Get help and send feedback';

  @override
  String get profileMySchedulesSectionTitle => 'My activities and events';

  @override
  String get profileMySchedulesTitle => 'My activities and events';

  @override
  String get profileMySchedulesSubtitle => 'View saved';

  @override
  String get profileSettingsSectionTitle => 'Settings';

  @override
  String get profileSettingsTitle => 'Settings';

  @override
  String get profileSettingsSubtitle => 'Theme, language and more';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageEnglish => 'English';
}
