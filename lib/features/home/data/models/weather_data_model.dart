import 'package:weather_app/features/home/data/models/days_data_model.dart';
import 'package:weather_app/features/home/data/models/hours_data_model.dart';
import 'package:weather_app/features/home/domin/entites/weather_data.dart';

class WeatherDataModel extends WeatherData {
  const WeatherDataModel(
      {required super.name,
      required super.conditionImage,
      required super.maxTemp,
      required super.minTemp,
      required super.temp,
      required super.condition,
      required super.time,
      required super.hours,
      required super.days,
      required super.latitude,
      required super.longitude,
      required super.humidity,
      required super.windMph,
      required super.windDir,
      required super.dailyWillItRain,
      required super.dailyChanceOfRain,
      required super.precipitationAmountMillimeters,
      required super.cloud,
      required super.avgHumidity,
      required super.avgTemp});

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      name: json['location']['name'],
      latitude: json['location']['lat'],
      longitude: json['location']['lon'],
      humidity: json['current']['humidity'],
      windDir: json['current']['wind_dir'],
      windMph: json['current']['wind_mph'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      time: json['location']['localtime'],
      conditionImage: json['current']['condition']['icon'],
      hours: (json['forecast']['forecastday'][0]['hour'] as List)
          .map((i) => HoursDataModel.fromJson(i))
          .toList(),
      days: (json['forecast']['forecastday'] as List)
          .map((i) => DaysDataModel.fromJson(i))
          .toList(),
      dailyWillItRain: json['forecast']['forecastday'][0]['daily_will_it_rain']??0,
      dailyChanceOfRain: json['forecast']['forecastday'][0]
          ['daily_chance_of_rain']??0,
      avgHumidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      cloud: json['current']['cloud'],
      precipitationAmountMillimeters: json['forecast']['forecastday'][0]['day']
          ['totalprecip_mm'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
