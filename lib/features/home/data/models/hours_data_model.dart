import 'package:weather_app/features/home/domin/entites/hours_data.dart';

class HoursDataModel extends HoursData {
  const HoursDataModel(
      {required super.temp,
      required super.condition,
      required super.conditionImage,
      required super.time});

  factory HoursDataModel.fromJson(Map<String, dynamic> json) {
    return HoursDataModel(
      temp: json['temp_c'],
      condition: json["condition"]["text"],
      conditionImage: json['condition']['icon'],
      time: json['time'],
    );
  }
}
