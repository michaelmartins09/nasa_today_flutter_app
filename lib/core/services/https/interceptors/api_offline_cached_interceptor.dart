import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiOfflineCachedInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final storage = await SharedPreferences.getInstance();
    final key = response.requestOptions.uri.toString();

    if (response.statusCode == 200) {
      await storage.setString(key, jsonEncode(response.data));
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final key = err.requestOptions.uri.toString();
    final storage = await SharedPreferences.getInstance();
    final body = storage.getString(key);

    if (body != null) {
      final response = Response(
        requestOptions: err.requestOptions,
        data: jsonDecode(body),
        statusCode: 200,
      );

      handler.resolve(response);
    }
    super.onError(err, handler);
  }
}
