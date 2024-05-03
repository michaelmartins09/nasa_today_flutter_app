import 'package:nasa_today/app/data/models/models.dart';

abstract class IGetAstronomyPictureOfTheDayUseCase {
  Future<AstronomyPictureDto> call();
}
