import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/exceptions/exceptions.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

class GetAstronomyPictureOfTheDayRepositoryImp
    implements IGetAstronomyPictureOfTheDayRepository {
  final IGetAstronomyPictureOfTheDayDatasource _datasource;

  GetAstronomyPictureOfTheDayRepositoryImp(this._datasource);

  @override
  Future<AstronomyPictureDto> call() async {
    try {
      return await _datasource();
    } catch (_) {
      throw NTGenericException();
    }
  }
}
