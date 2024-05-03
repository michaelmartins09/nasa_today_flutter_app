import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/entities/entities.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

import '../../../utils/utils.dart';
import 'get_astronomy_picture_of_the_day_test.mocks.dart';

@GenerateMocks([IGetAstronomyPictureOfTheDayRepository])
void main() {
  late IGetAstronomyPictureOfTheDayUseCase usecase;
  late IGetAstronomyPictureOfTheDayRepository repository;
  late AstronomyPictureDto pictureTodayEntityFaker;

  setUp(() {
    repository = MockIGetAstronomyPictureOfTheDayRepository();
    usecase = GetAstronomyPictureOfTheDayUsecaseImp(repository);

    pictureTodayEntityFaker = TestMocks.astronomyPictureToday;
  });

  group('success tests', () {
    test(
      'Should return a AstronomyPictureEntity when request is success',
      () async {
        when(repository()).thenAnswer(
          (_) async => Future.value(pictureTodayEntityFaker),
        );

        final pictureOfTheDay = await usecase();

        expect(pictureOfTheDay, isA<AstronomyPictureEntity>());
      },
    );
  });

  group('errors tests', () {
    test(
      'Should throw a NTException when request got any error',
      () async {
        when(repository()).thenThrow(NTGenericException());

        final future = usecase();

        expect(future, throwsA(isA<NTException>()));
      },
    );
  });
}
