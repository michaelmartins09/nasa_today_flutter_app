// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_HomeControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadingListAtom =
      Atom(name: '_HomeControllerBase.loadingList', context: context);

  @override
  bool get loadingList {
    _$loadingListAtom.reportRead();
    return super.loadingList;
  }

  @override
  set loadingList(bool value) {
    _$loadingListAtom.reportWrite(value, super.loadingList, () {
      super.loadingList = value;
    });
  }

  late final _$pictureTodayAtom =
      Atom(name: '_HomeControllerBase.pictureToday', context: context);

  @override
  AstronomyPictureDto? get pictureToday {
    _$pictureTodayAtom.reportRead();
    return super.pictureToday;
  }

  @override
  set pictureToday(AstronomyPictureDto? value) {
    _$pictureTodayAtom.reportWrite(value, super.pictureToday, () {
      super.pictureToday = value;
    });
  }

  late final _$picturesListAtom =
      Atom(name: '_HomeControllerBase.picturesList', context: context);

  @override
  ObservableList<AstronomyPictureDto> get picturesList {
    _$picturesListAtom.reportRead();
    return super.picturesList;
  }

  @override
  set picturesList(ObservableList<AstronomyPictureDto> value) {
    _$picturesListAtom.reportWrite(value, super.picturesList, () {
      super.picturesList = value;
    });
  }

  late final _$fetchAstronomyPictureTodayAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchAstronomyPictureToday',
      context: context);

  @override
  Future<void> fetchAstronomyPictureToday() {
    return _$fetchAstronomyPictureTodayAsyncAction
        .run(() => super.fetchAstronomyPictureToday());
  }

  late final _$fetchRandomAstronomyPicturesAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchRandomAstronomyPictures',
      context: context);

  @override
  Future<void> fetchRandomAstronomyPictures(
      {int randomSize = 15, DateTime? date}) {
    return _$fetchRandomAstronomyPicturesAsyncAction.run(() =>
        super.fetchRandomAstronomyPictures(randomSize: randomSize, date: date));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingList: ${loadingList},
pictureToday: ${pictureToday},
picturesList: ${picturesList}
    ''';
  }
}
