import 'package:weather_app/features/home/domin/entites/hours_data.dart';

class HoursDataModel extends HoursData {
  const HoursDataModel(
      {required super.temp,
      required super.condition,
      required super.conditionImage,
      required super.time,
      required super.willItRain,
      required super.chanceOfRain});

  factory HoursDataModel.fromJson(Map<String, dynamic> json) {
    return HoursDataModel(
      chanceOfRain: json['chance_of_rain'],
      willItRain: json['will_it_rain'],
      temp: json['temp_c'],
      condition: json["condition"]["text"],
      conditionImage: json['condition']['icon'],
      time: json['time'],
    );
  }
}
