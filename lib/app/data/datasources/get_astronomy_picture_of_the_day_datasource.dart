import 'package:nasa_today/app/domain/entities/entities.dart';

abstract class IGetAstronomyPictureOfTheDayDatasource {
  Future<AstronomyPictureEntity> call();
}
