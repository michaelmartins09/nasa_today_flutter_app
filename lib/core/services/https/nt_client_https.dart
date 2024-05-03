import 'package:dio/dio.dart';
import 'package:nasa_today/core/services/https/https.dart';

class NTClientHttps extends NTClientHtttpsBase {
  NTClientHttps() : super(BaseOptions(baseUrl: 'https://api.nasa.gov/'));
}
