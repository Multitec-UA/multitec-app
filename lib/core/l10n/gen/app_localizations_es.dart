// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get home => 'Inicio';

  @override
  String get genericError => 'Ha ocurrido un error.';

  @override
  String get errorNetworkGeneric =>
      'Error de conexión. Revisa tu conexión a Internet.';

  @override
  String get errorTimeoutGeneric =>
      'La solicitud ha superado el tiempo de espera. Inténtalo de nuevo.';

  @override
  String get errorPermissionGeneric => 'Permiso denegado.';

  @override
  String get errorLocationGeneric =>
      'El servicio de ubicación no está disponible.';

  @override
  String get errorAuthenticationGeneric =>
      'Ha habido un problema de autenticación.';

  @override
  String get errorEmailAlreadyInUse => 'El correo electrónico ya está en uso.';

  @override
  String get errorInvalidCredentials => 'Credenciales inválidas.';

  @override
  String get errorWeakPassword => 'La contraseña es demasiado débil.';

  @override
  String get errorUserNotFound => 'Usuario no encontrado.';

  @override
  String get errorWrongPassword => 'Contraseña incorrecta.';

  @override
  String get errorDomainNotAllowed =>
      'Solo cuentas @multitecua.com pueden acceder.';

  @override
  String get errorNetworkBadCertificate =>
      'Fallo de conexión segura (error de certificado SSL).';

  @override
  String get errorHttp400BadRequest => 'Solicitud incorrecta.';

  @override
  String get errorHttp401Unauthorized => 'No autorizado.';

  @override
  String get errorHttp403Forbidden => 'Prohibido.';

  @override
  String get errorHttp404NotFound => 'Recurso no encontrado.';

  @override
  String get errorHttp409Conflict => 'Conflicto al procesar la solicitud.';

  @override
  String get errorHttp429TooManyRequests =>
      'Demasiadas solicitudes. Inténtalo de nuevo más tarde.';

  @override
  String get errorHttp5xxServer =>
      'Error del servidor. Inténtalo de nuevo más tarde.';

  @override
  String get exampleListNetworkError =>
      'No se ha podido obtener la lista debido a un fallo de conexión';

  @override
  String get exampleListTimeoutError =>
      'No se ha podido obtener la lista porque ha tardado demasiado';

  @override
  String get joinedSchedulesNetworkError =>
      'No se han podido obtener tus eventos debido a un fallo de conexión';

  @override
  String get joinedSchedulesTimeoutError =>
      'No se han podido obtener tus eventos porque ha tardado demasiado';

  @override
  String get signInNetworkError =>
      'No se ha podido iniciar sesión debido a un fallo de conexión';

  @override
  String get signInTimeoutError =>
      'No se ha podido iniciar sesión porque ha tardado demasiado';

  @override
  String get details => 'Detalles';

  @override
  String get date => 'Fecha';

  @override
  String get time => 'Hora';

  @override
  String get location => 'Ubicación';

  @override
  String get attendees => 'Asistentes';

  @override
  String get joinEvent => 'Unirse al Evento';

  @override
  String get leaveEvent => 'Salir del Evento';

  @override
  String welcomeUser(Object name) {
    return '¡Bienvenido, $name!';
  }

  @override
  String get homeUpcomingSectionTitle => 'Próximos eventos y actividades';

  @override
  String get homeQuickActionsSectionTitle => 'Acciones rápidas';

  @override
  String get joinedSchedulesTitle => 'Mis actividades y eventos';

  @override
  String get joinedSchedulesEmptyTitle =>
      'No te has unido a ningún evento o actividad';

  @override
  String get joinedSchedulesEmptySubtitle =>
      'Explora los eventos y actividades disponibles para unirte';

  @override
  String get listErrorTitle => 'Error al cargar';

  @override
  String get retry => 'Reintentar';

  @override
  String get scheduleEmptyTitle => 'No hay eventos próximos';

  @override
  String get scheduleEmptySubtitle =>
      'Vuelve pronto para ver nuevos eventos y actividades';

  @override
  String get scheduleLoadError => 'Error al cargar eventos';

  @override
  String get seeMore => 'Ver más';

  @override
  String get events => 'eventos';

  @override
  String get developerSectionTitle => 'Desarrollador';

  @override
  String get developerClearDbTitle => 'Limpiar base de datos';

  @override
  String get developerClearDbSubtitle => 'Eliminar datos locales';

  @override
  String get signInWelcomeTitle => 'Bienvenido a Multitec';

  @override
  String get signInWelcomeDescription =>
      'Inicia sesión para acceder a la comunidad de Multitec UA';

  @override
  String get domainRestrictionNotice => 'Solo cuentas @multitecua.com';

  @override
  String get signInWithGoogle => 'Iniciar sesión con Google';

  @override
  String get signInHelpContent =>
      'Debes usar una cuenta de Google con el dominio @multitecua.com.\n\nSi necesitas acceso, contacta con tu coordinador o soporte.';

  @override
  String get understood => 'Entendido';

  @override
  String get needHelpQuestion => '¿Necesitas ayuda?';

  @override
  String get reportSentSuccess => 'Informe enviado correctamente';

  @override
  String get sending => 'Enviando…';

  @override
  String get sendReport => 'Enviar informe';

  @override
  String get noItemsAvailable => 'No hay elementos disponibles';

  @override
  String get eventDetailsTitle => 'Detalles del Evento';

  @override
  String get activityDetailsTitle => 'Detalles de la Actividad';

  @override
  String get eventInfoSectionTitle => 'Información del Evento';

  @override
  String get participationSectionTitle => 'Participación';

  @override
  String get registeredPeople => 'Personas inscritas';

  @override
  String get scheduleTabEvents => 'Eventos';

  @override
  String get scheduleTabActivities => 'Actividades';

  @override
  String get quickActionsEventsTitle => 'Eventos';

  @override
  String get quickActionsEventsSubtitle => 'Ver eventos';

  @override
  String get quickActionsActivitiesTitle => 'Actividades';

  @override
  String get quickActionsActivitiesSubtitle => 'Ver actividades';

  @override
  String get quickActionsSavedTitle => 'Mis guardados';

  @override
  String get quickActionsSavedSubtitle => 'Ver eventos y actividades guardados';

  @override
  String get quickActionsExampleTitle => 'Feature Example';

  @override
  String get quickActionsExampleSubtitle => 'Ir a Feature Example';

  @override
  String get confirm => 'Aceptar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get signOutDialogTitle => 'Cerrar sesión';

  @override
  String get signOutDialogContent =>
      '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get signOutConfirm => 'Cerrar sesión';

  @override
  String get privacyPolicyPrefix => 'Al continuar aceptas nuestra ';

  @override
  String get privacyPolicyLinkText => 'política de privacidad';

  @override
  String get privacyPolicySuffix => '.';

  @override
  String get privacyPolicyUrl => 'https://www.google.com';

  @override
  String get loadMoreError => 'Error al cargar más elementos';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get themeSystemTitle => 'Tema del sistema';

  @override
  String get themeSystemSubtitle => 'Seguir configuración del dispositivo';

  @override
  String get themeLightTitle => 'Tema claro';

  @override
  String get helpAndFeedbackTitle => 'Ayuda y Feedback';

  @override
  String get contactDeveloperTitle => 'Contactar con el desarrollador';

  @override
  String get contactDeveloperSubtitle =>
      'Invitar a un café virtual y ponerse en contacto';

  @override
  String get contactDeveloperEmailSubject => 'Te invito a un café';

  @override
  String get contactDeveloperEmailBody =>
      '¡Hola! \n\nMe gustaría invitarte a un café virtual para charlar sobre Multitec UA y ponernos en contacto. \n\n¡Espero tu respuesta! \n\nSaludos, [ Tu Nombre ]';

  @override
  String get reportBugTitle => 'Reportar un bug / Sugerir una funcionalidad';

  @override
  String get reportBugSubtitle =>
      'Enviar reporte de errores o solicitar nuevas características';

  @override
  String get reportBugEmailSubject =>
      'Reporte de bug o solicitud de funcionalidad';

  @override
  String get reportBugEmailBody =>
      'Hola, \n\nHe encontrado un problem en Multitec UA que quiero reportar. Aquí están los detalles: \n[Descripción breve del bug o problem] \n\nDispositivo y versión del sistema operativo: \n[Información del dispositivo y versión del SO] \n\nO, \n\nTengo una idea para una nueva funcionalidad que podría ser genial para Multitec UA: \n[Descripción de la funcionalidad sugerida] \n\nGracias por tu atención. \n\nSaludos, [ Tu Nombre ]';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsPreferencesTitle => 'Preferencias';

  @override
  String get settingsHelpTitle => 'Ayuda';

  @override
  String get settingsAccountTitle => 'Cuenta';

  @override
  String get helpAndFeedbackSubtitle => 'Obtener ayuda y enviar comentarios';

  @override
  String get profileMySchedulesSectionTitle => 'Mis actividades y eventos';

  @override
  String get profileMySchedulesTitle => 'Mis actividades y eventos';

  @override
  String get profileMySchedulesSubtitle => 'Ver guardados';

  @override
  String get profileSettingsSectionTitle => 'Configuración';

  @override
  String get profileSettingsTitle => 'Ajustes';

  @override
  String get profileSettingsSubtitle => 'Tema, idioma y más';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'Inglés';
}
