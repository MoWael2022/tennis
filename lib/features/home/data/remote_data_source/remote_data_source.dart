import 'package:weather_app/core/constant/api_constant.dart';
import 'package:weather_app/features/home/data/models/weather_data_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/weather_error_handling.dart';

class RemoteDataSource {

  Future<WeatherDataModel> fetchWeatherData(String countryName) async {
    Dio dio = Dio();

    try {
      final response = await dio.get(Constant.getWeatherData(countryName));
      print(response.data);
      final data = WeatherDataModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw handleWeatherException(e);
    }
  }
}
