import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/domain/entities/astronomy_picture_entity.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

class GetAstronomyPictureOfTheDayRepositoryImp
    implements IGetAstronomyPictureOfTheDayRepository {
  final IGetAstronomyPictureOfTheDayDatasource _datasource;

  GetAstronomyPictureOfTheDayRepositoryImp(this._datasource);

  @override
  Future<AstronomyPictureEntity> call() async {
    return await _datasource();
  }
}
