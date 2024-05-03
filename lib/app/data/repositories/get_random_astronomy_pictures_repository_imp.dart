import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

import '../../domain/exceptions/exceptions.dart';

class GetRandomAstronomyPicturesRepositoryImp
    implements IGetRandomAstronomyPicturesRepository {
  final IGetRandomAstronomyPicturesDatasource _repository;

  GetRandomAstronomyPicturesRepositoryImp(this._repository);

  @override
  Future<List<AstronomyPictureDto>> call({
    required int randomSize,
    DateTime? date,
  }) async {
    try {
      return await _repository(randomSize: randomSize, date: date);
    } catch (e) {
      throw NTGenericException();
    }
  }
}
