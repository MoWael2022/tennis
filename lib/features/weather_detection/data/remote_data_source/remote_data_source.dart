import 'package:dio/dio.dart';
import 'package:weather_app/core/constant/api_constant.dart';
import 'package:weather_app/core/network/prediction_error_handling.dart';
import 'package:weather_app/core/network/weather_error_handling.dart';
import 'package:weather_app/features/weather_detection/data/model/weather_prediction_data_returned_model.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_entered.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';

class PredictionRemoteDataSource {
  Future<WeatherPredictionDataReturned> getWeatherPrediction(
      WeatherPredictionDataEnter input) async {
    Dio dio = Dio();

    try {
      final response =
          await dio.post(Constant.predictionUrl, data: input.toJson());
      final data = WeatherPredictionDataReturnedModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw predictionErrorHandling(e);
    }
  }
}
