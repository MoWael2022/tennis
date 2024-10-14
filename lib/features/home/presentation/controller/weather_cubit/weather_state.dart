import 'package:weather_app/features/home/domin/entites/weather_data.dart';

abstract class WeatherState {}

class InitState extends WeatherState {}

class LoadingWeatherDataState extends WeatherState {}

class LoadedWeatherDataState extends WeatherState {
  WeatherData data;

  LoadedWeatherDataState(this.data);
}

class ErrorWeatherDataState extends WeatherState {
  String message;

  ErrorWeatherDataState(this.message);
}


