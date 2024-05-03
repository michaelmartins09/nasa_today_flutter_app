import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';
import 'package:nasa_today/app/externals/datasources/datasources.dart';
import 'package:nasa_today/core/core.dart';
import 'package:nasa_today/core/services/https/https.dart';

import 'app_module_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NTClientHttps>(as: #MockNTClientHttps),
])
void main() {
  late NTClientHttps clientHttps;

  setUp(() {
    clientHttps = MockNTClientHttps();

    Modular.bindModule(AppModule());
    Modular.replaceInstance(clientHttps);
  });

  tearDown(() => reset(clientHttps));

  group('Verify binds usecases', () {
    test(
        'Should return a instance of GetRandomAstronomyPicturesUsecaseImp from bind abstract',
        () {
      final client = Modular.get<IGetRandomAstronomyPicturesUsecase>();

      expect(client, isA<GetRandomAstronomyPicturesUsecaseImp>());
    });

    test(
        'Should return a instance of GetAstronomyPictureOfTheDayUseCaseImp from bind abstract',
        () {
      final client = Modular.get<IGetAstronomyPictureOfTheDayUseCase>();

      expect(client, isA<GetAstronomyPictureOfTheDayUsecaseImp>());
    });
  });

  group('Verify binds repositories', () {
    test(
        'Should return a instance of GetRandomAstronomyPicturesRepositoryImp from bind abstract',
        () {
      final client = Modular.get<IGetRandomAstronomyPicturesRepository>();

      expect(client, isA<GetRandomAstronomyPicturesRepositoryImp>());
    });

    test(
        'Should return a instance of GetAstronomyPictureOfTheDayRepositoryImp from bind abstract',
        () {
      final client = Modular.get<IGetAstronomyPictureOfTheDayRepository>();

      expect(client, isA<GetAstronomyPictureOfTheDayRepositoryImp>());
    });
  });

  group('Verify binds datasources', () {
    test(
        'Should return a instance of GetRandomAstronomyPicturesDatasourceImp from bind abstract',
        () {
      final client = Modular.get<IGetRandomAstronomyPicturesDatasource>();

      expect(client, isA<GetRandomAstronomyPicturesDatasourceImp>());
    });

    test(
        'Should return a instance of GetAstronomyPictureOfTheDayDatasourceImp from bind abstract',
        () {
      final client = Modular.get<IGetAstronomyPictureOfTheDayDatasource>();

      expect(client, isA<GetAstronomyPictureOfTheDayDatasourceImp>());
    });
  });
}
