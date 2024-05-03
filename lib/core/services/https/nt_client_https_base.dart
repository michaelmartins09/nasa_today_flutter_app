import 'package:dio/dio.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';

abstract class NTClientHtttpsBase {
  final Dio _dio;

  NTClientHtttpsBase(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
  }) : _dio = Dio(baseOptions) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        options: options,
      );
    } on DioException catch (e) {
      throw NTException(e.message ?? '', e.message ?? '');
    }
  }
}
