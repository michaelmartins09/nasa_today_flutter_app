abstract class NTException implements Exception {
  final String message;
  final String error;

  NTException(this.message, this.error);
}
