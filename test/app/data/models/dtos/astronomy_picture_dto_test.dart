import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_today/app/data/models/models.dart';

void main() {
  group('AstronomyPictureDTO fromMap', () {
    test('Should returns an AstronomyPictureDTO class from map data', () {
      final faker = Faker();

      final astronomyPictureToday = {
        "date": "2021-08-18",
        "explanation": faker.lorem.sentence(),
        "hdurl": faker.internet.httpsUrl(),
        "media_type": faker.lorem.word(),
        "service_version": faker.lorem.word(),
        "title": faker.lorem.word(),
        "url": faker.internet.httpsUrl()
      };

      final result = AstronomyPictureDto.fromMap(astronomyPictureToday);

      expect(result, isA<AstronomyPictureDto>());
    });
  });
}
