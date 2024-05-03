import 'package:dio/dio.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';

abstract class NTClientHttpsBase {
  final Dio _dio;

  NTClientHttpsBase(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
  }) : _dio = Dio(baseOptions) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NTException(e.message ?? '', e.message ?? '');
    }
  }
}
