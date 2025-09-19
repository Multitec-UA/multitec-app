sealed class AppException implements Exception {
  AppException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => message;
}

class AuthDomainNotAllowedException extends AppException {
  AuthDomainNotAllowedException()
      : super(
          'domain-not-allowed',
          'Solo cuentas @multitecua.com pueden acceder.',
        );
}

// Examples
class ExampleException extends AppException {
  ExampleException() : super('example', 'Example');
}

class ExampleWithExtraParameterException extends AppException {
  ExampleWithExtraParameterException(this.parameter)
      : super(
          'example-with-extra-parameter',
          'Example with extra parameter: $parameter',
        );

  final String parameter;
}
