import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_entered.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';

import '../../../../core/failure/failure.dart';

abstract class PredictionBaseRepository{

  Future<Either<Failure,WeatherPredictionDataReturned>> getPredictionRepo(WeatherPredictionDataEnter input);
}