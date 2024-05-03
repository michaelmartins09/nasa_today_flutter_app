import 'exceptions.dart';

class NTInvalidArgumentException extends NTException {
  static const String defaultMessage = 'An argument passed is not valid';
  static const String defaultError = 'NT_INVALID_ARGUMENT';

  final String? argumentName;

  NTInvalidArgumentException({this.argumentName})
      : super(defaultMessage, defaultError);
}
