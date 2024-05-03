import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/core/services/https/https.dart';

import 'nt_client_https_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NTClientHttps>(as: #MockNTClientHttps),
  MockSpec<Dio>(as: #MockDio),
])
void main() {
  late NTClientHttpsBase client;
  late MockDio dio;
  const endpointExample = "/any_endpoint";

  setUp(() {
    dio = MockDio();
    client = NTClientHttps(interceptors: []);
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

  test('Should throw NTException from GET request method when exists errors',
      () async {
    when(dio.get(endpointExample)).thenThrow(
        DioException(requestOptions: RequestOptions(path: endpointExample)));

    expect(() async => await client.get(endpointExample),
        throwsA(isA<NTException>()));
  });
}
