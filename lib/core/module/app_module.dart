import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/repositories/repositories.dart';
import 'package:nasa_today/app/domain/repositories/repositories.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';
import 'package:nasa_today/app/externals/datasources/datasources.dart';
import 'package:nasa_today/app/presentation/pages/home/home_controller.dart';
import 'package:nasa_today/app/presentation/presentations.dart';
import 'package:nasa_today/core/services/https/https.dart';

/// [AppModule] This module is responsible for the main routes and binds of the application.
class AppModule extends Module {
  @override
  void binds(Injector i) {
    // UseCases
    i.addSingleton<IGetAstronomyPictureOfTheDayUseCase>(
        GetAstronomyPictureOfTheDayUsecaseImp.new);

    // Repositories
    i.addSingleton<IGetAstronomyPictureOfTheDayRepository>(
        GetAstronomyPictureOfTheDayRepositoryImp.new);

    // Datasources
    i.addSingleton<IGetAstronomyPictureOfTheDayDatasource>(
        GetAstronomyPictureOfTheDayDatasourceImp.new);

    // General
    i.addSingleton(NTClientHttps.new);
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.add(ChildRoute("/", child: (context) => const HomePage()));
  }
}
