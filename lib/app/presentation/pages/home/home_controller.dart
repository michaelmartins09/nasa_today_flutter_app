// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetAstronomyPictureOfTheDayUseCase _getAstronomyPictureOfTheDayUseCase;
  final IGetRandomAstronomyPicturesUsecase _getRandomAstronomyPicturesUseCase;

  _HomeControllerBase(
    this._getAstronomyPictureOfTheDayUseCase,
    this._getRandomAstronomyPicturesUseCase,
  );

  @observable
  bool loading = false;

  @observable
  bool loadingList = false;

  @observable
  AstronomyPictureDto? pictureToday;

  @observable
  ObservableList<AstronomyPictureDto> picturesList =
      <AstronomyPictureDto>[].asObservable();

  @action
  Future<void> fetchAstronomyPictureToday() async {
    try {
      loading = true;
      pictureToday = await _getAstronomyPictureOfTheDayUseCase();
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> fetchRandomAstronomyPictures({
    int randomSize = 15,
    DateTime? date,
  }) async {
    try {
      loadingList = true;
      picturesList.clear();

      final pictures = await _getRandomAstronomyPicturesUseCase(
        randomSize: randomSize,
        date: date,
      );

      picturesList = pictures.asObservable();
    } catch (_) {
    } finally {
      loadingList = false;
    }
  }
}
