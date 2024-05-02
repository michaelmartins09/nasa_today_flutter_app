import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/app/domain/usecases/usecases.dart';

void main() {
  test('Should return a AstronomyPicture when request is success', () async {
    // Arrange
    final usecase = GetAstronomyPictureOfTheDayUsecaseImp();
    // Act
    await usecase();
    // Assert
    verify(usecase());
  });
}
