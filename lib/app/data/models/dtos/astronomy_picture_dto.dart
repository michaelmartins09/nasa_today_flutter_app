import 'package:nasa_today/app/domain/entities/entities.dart';

class AstronomyPictureDto extends AstronomyPictureEntity {
  AstronomyPictureDto({
    super.copyright,
    required super.date,
    required super.explanation,
    required super.hdurl,
    required super.mediaType,
    required super.serviceVersion,
    required super.title,
    required super.url,
  });

  factory AstronomyPictureDto.fromMap(Map<String, dynamic> map) {
    return AstronomyPictureDto(
      copyright: map['copyright'],
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['media_type'],
      serviceVersion: map['service_version'],
      title: map['title'],
      url: map['url'],
    );
  }
}
