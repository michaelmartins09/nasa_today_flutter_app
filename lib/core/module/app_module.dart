import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/presentation/presentations.dart';

/// [AppModule] This module is responsible for the main routes and binds of the application.
class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(ChildRoute("/", child: (context) => const HomePage()));
  }
}
