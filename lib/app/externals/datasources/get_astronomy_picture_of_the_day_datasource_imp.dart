import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';

import '../../../core/services/https/https.dart';

class GetAstronomyPictureOfTheDayDatasourceImp
    implements IGetAstronomyPictureOfTheDayDatasource {
  final NTClientHttps _client;

  GetAstronomyPictureOfTheDayDatasourceImp(this._client);

  final _endpoint = "/planetary/apod";

  @override
  Future<AstronomyPictureDto> call() async {
    final response = await _client.get(_endpoint);

    return AstronomyPictureDto.fromMap(response.data);
  }
}
