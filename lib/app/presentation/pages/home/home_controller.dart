// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGetAstronomyPictureOfTheDayUseCase _getAstronomyPictureOfTheDayUseCase;

  _HomeControllerBase(this._getAstronomyPictureOfTheDayUseCase);

  @observable
  bool loading = false;

  @observable
  AstronomyPictureDto? pictureToday;

  @action
  Future<void> fetch() async {
    try {
      loading = true;
      pictureToday = await _getAstronomyPictureOfTheDayUseCase();
    } catch (_) {
    } finally {
      loading = false;
    }
  }
}
