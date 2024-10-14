import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:weather_app/features/home/domin/entites/weather_data.dart';
import 'package:weather_app/features/home/domin/repository/base_repository.dart';

class HomeRepository implements BaseRepository {
  final RemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);

  @override
  Future<Either<Failure, WeatherData>> getWeatherData(
      String countryName) async {
    try {
      final data = await _remoteDataSource.fetchWeatherData(countryName);
      return Right(data);
    } catch (failure) {
      return Left(Failure(message: failure.toString()));
    }
  }
}
