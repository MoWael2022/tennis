import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/weather_detection/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_entered.dart';

import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';

import '../../domin/repository/prediction_base_repository.dart';

class PredictionRepository extends PredictionBaseRepository {
  final PredictionRemoteDataSource _remoteDataSource;

  PredictionRepository(this._remoteDataSource);

  @override
  Future<Either<Failure, WeatherPredictionDataReturned>> getPredictionRepo(
      WeatherPredictionDataEnter input) async {
    try {
      final result = await _remoteDataSource.getWeatherPrediction(input);
      return Right(result);
    } catch (failure) {
      return Left(Failure(message: failure.toString()));
    }
  }
}
