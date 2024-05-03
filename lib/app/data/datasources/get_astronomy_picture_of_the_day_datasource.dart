import 'package:nasa_today/app/data/models/models.dart';

abstract class IGetAstronomyPictureOfTheDayDatasource {
  Future<AstronomyPictureDto> call();
}
