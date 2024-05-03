import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

import '../../../utils/utils.dart';
import 'get_random_astronomy_pictures_repository_test.mocks.dart';

@GenerateMocks([IGetRandomAstronomyPicturesDatasource])
void main() {
  late IGetRandomAstronomyPicturesRepository repository;
  late IGetRandomAstronomyPicturesDatasource datasource;
  late AstronomyPictureDto pictureTodayEntityFaker;

  setUp(() {
    datasource = MockIGetRandomAstronomyPicturesDatasource();
    repository = GetRandomAstronomyPicturesRepositoryImp(datasource);

    pictureTodayEntityFaker = TestMocks.astronomyPictureToday;
  });

  group("Success Tests", () {
    test(
      'Should that repository return a List of AstronomyPictureDto when request is success',
      () async {
        const randomSize = 3;

        final mockPicturesList =
            List.generate(randomSize, (index) => pictureTodayEntityFaker);

        when(datasource(randomSize: randomSize)).thenAnswer(
          (_) async => mockPicturesList,
        );

        final pictureOfTheDay = await repository(randomSize: randomSize);

        expect(pictureOfTheDay, isA<List<AstronomyPictureDto>>());
      },
    );
  });

  group("Failure Tests", () {
    test(
      'Should throws a NTGenericException when it occurs unexpected error',
      () async {
        const randomSize = 3;

        when(datasource(randomSize: randomSize)).thenThrow(Exception());

        final future = repository(randomSize: randomSize);

        expect(future, throwsA(isA<NTGenericException>()));
      },
    );
  });
}
