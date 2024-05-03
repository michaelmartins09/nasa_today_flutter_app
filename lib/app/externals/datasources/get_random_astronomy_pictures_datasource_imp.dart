import 'package:nasa_today/app/data/datasources/datasources.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/shared/extensions/date_extension.dart';

import '../../../core/services/https/https.dart';

class GetRandomAstronomyPicturesDatasourceImp
    implements IGetRandomAstronomyPicturesDatasource {
  final NTClientHttps _client;

  GetRandomAstronomyPicturesDatasourceImp(this._client);

  final _endpoint = "/planetary/apod";

  @override
  Future<List<AstronomyPictureDto>> call({
    required int randomSize,
    DateTime? date,
  }) async {
    final query = {
      if (date == null)
        "count": randomSize.toString()
      else
        "date": date.toFormatEn(),
    };
    final response = await _client.get(_endpoint, queryParameters: query);

    if (response.data is Map<String, dynamic>) {
      return [AstronomyPictureDto.fromMap(response.data)];
    }

    final list = response.data as List? ?? [];

    return list.map((picture) => AstronomyPictureDto.fromMap(picture)).toList();
  }
}
