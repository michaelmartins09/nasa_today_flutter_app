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

  setUp(() {
    dio = MockDio();
    client = NTClientHttps();
  });

  test('Successful GET request', () async {
    final response = Response(
      data: {'result': 'success'},
      requestOptions: RequestOptions(path: "/endpoint"),
      statusCode: 200,
    );

    when(dio.get("/endpoint")).thenAnswer((_) async => response);

    final result = await dio.get("/endpoint");

    expect(result.data, {'result': 'success'});
  });

  test('GET request throws an exception', () async {
    when(dio.get("/endpoint")).thenThrow(
        DioException(requestOptions: RequestOptions(path: "/endpoint")));

    expect(
        () async => await client.get("/endpoint"), throwsA(isA<NTException>()));
  });
}
