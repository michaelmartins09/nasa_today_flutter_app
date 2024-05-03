import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';
import 'package:nasa_today/app/externals/datasources/datasources.dart';
import 'package:nasa_today/app/presentation/pages/home/home_controller.dart';
import 'package:nasa_today/app/presentation/presentations.dart';
import 'package:nasa_today/core/services/https/https.dart';

/// [AppModule] This module is responsible for the main routes and binds of the application.
class AppModule extends Module {
  @override
  void binds(Injector i) {
    // General
    i.addLazySingleton(HomeController.new);
    i.addLazySingleton(NTClientHttps.new);

    // UseCases
    i.addLazySingleton(GetAstronomyPictureOfTheDayUsecaseImp.new);

    // Repositories
    i.addLazySingleton(GetAstronomyPictureOfTheDayRepositoryImp.new);

    // Datasources
    i.addLazySingleton(GetAstronomyPictureOfTheDayDatasourceImp.new);
  }

  @override
  void routes(RouteManager r) {
    r.add(ChildRoute("/", child: (context) => const HomePage()));
  }
}
