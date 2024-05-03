import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';

import '../exceptions/exceptions.dart';
import 'usecases.dart';

class GetRandomAstronomyPicturesUsecaseImp
    implements IGetRandomAstronomyPicturesUsecase {
  final IGetRandomAstronomyPicturesRepository _repository;

  GetRandomAstronomyPicturesUsecaseImp(this._repository);

  @override
  Future<List<AstronomyPictureDto>> call({
    required int randomSize,
    DateTime? date,
  }) async {
    if (randomSize <= 0) {
      throw NTInvalidArgumentException(argumentName: "randomSize");
    }

    if (date != null && date.isAfter(DateTime.now())) {
      throw NTInvalidArgumentException(argumentName: "date");
    }

    return await _repository(randomSize: randomSize, date: date);
  }
}
