import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';

class WeatherPredictionDataReturnedModel extends WeatherPredictionDataReturned {
  const WeatherPredictionDataReturnedModel({required super.prediction});

  factory WeatherPredictionDataReturnedModel.fromJson(Map<String,dynamic> json){
    return WeatherPredictionDataReturnedModel(prediction: json['prediction'][0]);
  }

}