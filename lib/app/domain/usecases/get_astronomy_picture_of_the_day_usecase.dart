import 'package:nasa_today/app/domain/entities/entities.dart';

abstract class IGetAstronomyPictureOfTheDayUseCase {
  Future<AstronomyPictureEntity> call();
}
