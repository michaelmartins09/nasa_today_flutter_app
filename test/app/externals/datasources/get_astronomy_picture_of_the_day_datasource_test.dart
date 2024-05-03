import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/externals/datasources/datasources.dart';
import 'package:nasa_today/core/services/https/https.dart';

import 'get_astronomy_picture_of_the_day_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NTClientHttps>(as: #MockNTClientHttps),
])
void main() {
  late IGetAstronomyPictureOfTheDayDatasource datasource;
  late NTClientHttps client;

  late Map<String, dynamic> paylodResponse;
  late Faker faker;

  setUpAll(() {
    client = MockNTClientHttps();
    datasource = GetAstronomyPictureOfTheDayDatasourceImp(client);

    faker = Faker();
    paylodResponse = {
      "date": "2021-08-18",
      "explanation": faker.lorem.sentence(),
      "hdurl": faker.internet.httpsUrl(),
      "media_type": faker.lorem.word(),
      "service_version": faker.lorem.word(),
      "title": faker.lorem.word(),
      "url": faker.internet.httpsUrl(),
    };
  });

  group("Success Tests", () {
    test(
      'Should that datasource return a AstronomyPictureDto when request is success',
      () async {
        when(client.get('/planetary/apod')).thenAnswer(
          (_) async => Response(
            data: paylodResponse,
            requestOptions: RequestOptions(),
            statusCode: 200,
          ),
        );

        final pictureOfTheDay = await datasource();

        expect(pictureOfTheDay, isA<AstronomyPictureDto>());
      },
    );
  });
}
