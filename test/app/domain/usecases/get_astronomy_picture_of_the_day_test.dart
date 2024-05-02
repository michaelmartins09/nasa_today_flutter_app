import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/domain/entities/entities.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

import 'get_astronomy_picture_of_the_day_test.mocks.dart';

@GenerateMocks([IGetAstronomyPictureOfTheDayRepository])
void main() {
  late IGetAstronomyPictureOfTheDayUseCase usecase;
  late IGetAstronomyPictureOfTheDayRepository repository;
  late Faker faker;
  late AstronomyPictureEntity pictureTodayEntityFaker;

  setUp(() {
    faker = Faker();

    repository = MockIGetAstronomyPictureOfTheDayRepository();
    usecase = GetAstronomyPictureOfTheDayUsecaseImp(repository);

    pictureTodayEntityFaker = AstronomyPictureEntity(
      copyright: faker.person.name(),
      date: faker.date.dateTime(),
      explanation: faker.lorem.sentence(),
      hdurl: faker.image.image(),
      mediaType: faker.image.image(),
      serviceVersion: faker.lorem.word(),
      title: faker.lorem.word(),
      url: faker.image.image(),
    );
  });

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
}
