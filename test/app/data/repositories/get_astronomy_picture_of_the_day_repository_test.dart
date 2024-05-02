import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/entities/entities.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

import '../../../utils/utils.dart';
import 'get_astronomy_picture_of_the_day_repository_test.mocks.dart';

@GenerateMocks([IGetAstronomyPictureOfTheDayDatasource])
void main() {
  late IGetAstronomyPictureOfTheDayRepository repository;
  late IGetAstronomyPictureOfTheDayDatasource datasource;
  late AstronomyPictureEntity pictureTodayEntityFaker;

  setUp(() {
    datasource = MockIGetAstronomyPictureOfTheDayDatasource();
    repository = GetAstronomyPictureOfTheDayRepositoryImp(datasource);

    pictureTodayEntityFaker = TestMocks.astronomyPictureToday;
  });

  group("Success Tests", () {
    test(
      'Should that repository return a AstronomyPictureEntity when request is success',
      () async {
        when(repository()).thenAnswer(
          (_) async => Future.value(pictureTodayEntityFaker),
        );

        final pictureOfTheDay = await repository();

        expect(pictureOfTheDay, isA<AstronomyPictureEntity>());
      },
    );
  });

  group("Failure Tests", () {
    test(
      'Should returns a NTGenericException when it occurs unexpected error',
      () async {
        when(repository()).thenThrow(Exception());

        final future = repository();

        expect(future, throwsA(isA<NTGenericException>()));
      },
    );
  });
}
