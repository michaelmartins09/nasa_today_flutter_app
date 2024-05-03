import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';
import 'package:nasa_today/app/externals/datasources/datasources.dart';
import 'package:nasa_today/app/presentation/presentations.dart';
import 'package:nasa_today/core/services/https/https.dart';

/// [AppModule] This module is responsible for the main routes and binds of the application.
class AppModule extends Module {
  @override
  void binds(Injector i) {
    // Https
    i.addLazySingleton((i) => NTClientHttps());

    // UseCases
    i.addLazySingleton((i) => GetAstronomyPictureOfTheDayUsecaseImp(i));

    // Repositories
    i.addLazySingleton((i) => GetAstronomyPictureOfTheDayRepositoryImp(i));

    // Datasources
    i.addLazySingleton((i) => GetAstronomyPictureOfTheDayDatasourceImp(i));
  }

  @override
  void routes(RouteManager r) {
    r.add(ChildRoute("/", child: (context) => const HomePage()));
  }
}
