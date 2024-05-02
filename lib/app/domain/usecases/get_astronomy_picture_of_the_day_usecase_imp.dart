import 'package:nasa_today/app/domain/entities/astronomy_picture_entity.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

class GetAstronomyPictureOfTheDayUsecaseImp
    implements IGetAstronomyPictureOfTheDayUseCase {
  final IGetAstronomyPictureOfTheDayRepository repository;

  GetAstronomyPictureOfTheDayUsecaseImp(this.repository);

  @override
  Future<AstronomyPictureEntity> call() async {
    return await repository();
  }
}
