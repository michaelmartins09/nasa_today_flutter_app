import 'package:nasa_today/app/data/models/models.dart';

abstract class IGetAstronomyPictureOfTheDayRepository {
  Future<AstronomyPictureDto> call();
}
