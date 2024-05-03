import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

class GetAstronomyPictureOfTheDayUsecaseImp
    implements IGetAstronomyPictureOfTheDayUseCase {
  final IGetAstronomyPictureOfTheDayRepository _repository;

  GetAstronomyPictureOfTheDayUsecaseImp(this._repository);

  @override
  Future<AstronomyPictureDto> call() async {
    return await _repository();
  }
}
