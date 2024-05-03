import 'package:nasa_today/app/data/models/models.dart';

abstract class IGetRandomAstronomyPicturesRepository {
  Future<List<AstronomyPictureDto>> call({
    required int randomSize,
    DateTime? date,
  });
}
