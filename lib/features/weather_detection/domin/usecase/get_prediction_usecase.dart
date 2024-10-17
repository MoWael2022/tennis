import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_entered.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';
import 'package:weather_app/features/weather_detection/domin/repository/prediction_base_repository.dart';

import '../../../../core/failure/failure.dart';

class GetPredictionUseCase {
  final PredictionBaseRepository _predictionBaseRepository;

  GetPredictionUseCase(this._predictionBaseRepository);

  Future<Either<Failure, WeatherPredictionDataReturned>> execute(
      WeatherPredictionDataEnter input) async {
    return await _predictionBaseRepository.getPredictionRepo(input);
  }
}
