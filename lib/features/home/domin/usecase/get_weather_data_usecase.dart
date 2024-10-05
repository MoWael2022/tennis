import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/home/domin/entites/weather_data.dart';
import 'package:weather_app/features/home/domin/repository/base_repository.dart';
import 'package:weather_app/features/home/domin/usecase/base_usecase.dart';

class GetWeatherDataUseCase extends BaseHomeUseCase<String, WeatherData> {
  final BaseRepository _baseRepository;

  GetWeatherDataUseCase(this._baseRepository);

  @override
  Future<Either<Failure, WeatherData>> call(String input) async {
    return await _baseRepository.getWeatherData(input);
  }
}
