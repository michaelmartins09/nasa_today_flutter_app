import 'package:dio/dio.dart';

/// Interceptor that adds the API key to the query parameters of the request.
/// The API key is obtained from the environment variables (config.json).
class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const apiKey = String.fromEnvironment('API_KEY');

    options.queryParameters.addAll({'api_key': apiKey});

    handler.next(options);
  }
}
