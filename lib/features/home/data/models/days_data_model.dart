import 'package:weather_app/features/home/domin/entites/day_data.dart';

class DaysDataModel extends DaysData {
  const DaysDataModel(
      {required super.maxTemp,
      required super.minTemp,
      required super.temp,
      required super.time,
      required super.condition,
      required super.conditionImage,
      required super.humidity,

      required super.windSpeed});

  factory DaysDataModel.fromJson(Map<String, dynamic> json) {
    return DaysDataModel(
      maxTemp: json['day']['maxtemp_c'],
      minTemp: json['day']['mintemp_c'],
      temp: json['day']['avgtemp_c'],
      time: json['date'],
      condition: json['day']['condition']['text'],
      conditionImage: json['day']['condition']['icon'],
      humidity: json['day']['avghumidity'],
      windSpeed: json['day']['maxwind_kph'],
    );
  }
}
