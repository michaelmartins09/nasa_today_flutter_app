import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

import '../../../utils/utils.dart';
import 'get_random_astronomy_pictures_usecase_test.mocks.dart';

@GenerateMocks([IGetRandomAstronomyPicturesRepository])
void main() {
  late IGetRandomAstronomyPicturesUsecase usecase;
  late IGetRandomAstronomyPicturesRepository repository;
  late AstronomyPictureDto pictureTodayEntityFaker;

  setUp(() {
    repository = MockIGetRandomAstronomyPicturesRepository();
    usecase = GetRandomAstronomyPicturesUsecaseImp(repository);

    pictureTodayEntityFaker = TestMocks.astronomyPictureToday;
  });

  test('should return a list of AstronomyPictureDto', () async {
    const mockRandomSize = 1;

    final mockAstronomyPicturesList = List.generate(
      mockRandomSize,
      (index) => pictureTodayEntityFaker,
    );

    when(repository(randomSize: mockRandomSize)).thenAnswer(
      (_) async => mockAstronomyPicturesList,
    );

    final result = await usecase(randomSize: mockRandomSize);

    expect(result, isA<List<AstronomyPictureDto>>());
  });

  test(
      'should throw NTInvalidArgumentException whe randomSize is not valid or equals 0',
      () async {
    // arrange
    const mockRandomSize = 0;

    expect(
      (() async => await usecase(randomSize: mockRandomSize)),
      throwsA(isA<NTInvalidArgumentException>()),
    );
  });

  test('should throw NTInvalidArgumentException whe date is after today',
      () async {
    // arrange
    const mockRandomSize = 1;
    final nextDay = DateTime.now().add(const Duration(days: 1));

    expect(
      (() async => await usecase(randomSize: mockRandomSize, date: nextDay)),
      throwsA(isA<NTInvalidArgumentException>()),
    );
  });
}
