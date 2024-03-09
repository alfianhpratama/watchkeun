import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_recommendations_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetRecommendationsSeries usecase;
  late MockSeriesRepository mockSeriesRepository;

  setUp(() {
    mockSeriesRepository = MockSeriesRepository();
    usecase = GetRecommendationsSeries(mockSeriesRepository);
  });

  const tId = 1;
  final tSeries = <Series>[testSeries, testSeries, testSeries];

  test('should get list of series recommendations from the repository',
      () async {
    // arrange
    when(mockSeriesRepository.getSeriesRecommendations(tId))
        .thenAnswer((_) async => Right(tSeries));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tSeries));
  });
}
