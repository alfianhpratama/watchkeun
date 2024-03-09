import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_on_air_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetOnAirSeries usecase;
  late MockSeriesRepository mockSeriesRepository;

  setUp(() {
    mockSeriesRepository = MockSeriesRepository();
    usecase = GetOnAirSeries(mockSeriesRepository);
  });

  final tSeries = <Series>[testSeries, testSeries];

  test('should get list of series from the repository', () async {
    // arrange
    when(mockSeriesRepository.getOnAirSeries())
        .thenAnswer((_) async => Right(tSeries));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tSeries));
  });
}
