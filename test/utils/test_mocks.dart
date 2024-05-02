import 'package:faker/faker.dart';
import 'package:nasa_today/app/domain/entities/entities.dart';

class TestMocks {
  static AstronomyPictureEntity get astronomyPictureToday {
    final faker = Faker();

    return AstronomyPictureEntity(
      copyright: faker.person.name(),
      date: faker.date.dateTime(),
      explanation: faker.lorem.sentence(),
      hdurl: faker.image.image(),
      mediaType: faker.image.image(),
      serviceVersion: faker.lorem.word(),
      title: faker.lorem.word(),
      url: faker.image.image(),
    );
  }
}
