import 'exceptions.dart';

class NTApiKeyInvalidException extends NTException {
  static const String defaultMessage = 'An invalid api_key was supplied.';
  static const String defaultError = 'API_KEY_INVALID';

  NTApiKeyInvalidException() : super(defaultMessage, defaultError);
}
