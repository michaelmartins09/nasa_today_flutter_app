import 'exceptions.dart';

class NTGenericException extends NTException {
  static const String defaultMessage = 'An unexpected error occurred';
  static const String defaultError = 'NT_GENERIC_EXCEPTION';

  NTGenericException() : super(defaultMessage, defaultError);
}
