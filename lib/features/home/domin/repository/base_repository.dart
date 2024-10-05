import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app/features/home/domin/entites/weather_data.dart';

abstract class BaseRepository {
  Future<Either<Failure, WeatherData>> getWeatherData(String countryName);
}
