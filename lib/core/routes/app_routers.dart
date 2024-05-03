import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/data/models/models.dart';

class AppRoutes {
  static void goToDetailPage(AstronomyPictureDto picture) {
    Modular.to.pushNamed("/details", arguments: picture);
  }
}
