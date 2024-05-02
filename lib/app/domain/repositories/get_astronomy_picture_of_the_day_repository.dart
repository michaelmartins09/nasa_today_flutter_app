import 'package:nasa_today/app/domain/entities/entities.dart';

abstract class IGetAstronomyPictureOfTheDayRepository {
  Future<AstronomyPictureEntity> call();
}
