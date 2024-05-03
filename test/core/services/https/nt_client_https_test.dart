import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/core/services/https/https.dart';

import 'nt_client_https_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NTClientHttps>(as: #MockNTClientHttps),
  MockSpec<Dio>(as: #MockDio),
])
void main() {
  late MockDio dio;
  const endpointExample = "/any_endpoint";

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    dio = MockDio();
  });

  test('Should returns successful GET request', () async {
    final response = Response(
      data: {'result': 'success'},
      requestOptions: RequestOptions(path: endpointExample),
      statusCode: 200,
    );

    when(dio.get(endpointExample)).thenAnswer((_) async => response);

    final result = await dio.get(endpointExample);

    expect(result.data, {'result': 'success'});
  });
}
