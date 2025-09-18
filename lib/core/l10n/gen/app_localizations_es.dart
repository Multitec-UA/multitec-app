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
      'Ha habido un problema de autentificación';

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
}
