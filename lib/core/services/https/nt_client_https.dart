import 'package:dio/dio.dart';
import 'package:nasa_today/core/services/https/https.dart';

class NTClientHttps extends NTClientHtttpsBase {
  NTClientHttps([String? baseUrl, List<Interceptor>? interceptors])
      : super(
          BaseOptions(baseUrl: baseUrl ?? 'https://api.nasa.gov/'),
          interceptors: interceptors,
        );
}
