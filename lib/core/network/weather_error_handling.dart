import 'package:dio/dio.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/core/network/error_message_model.dart';

Failure handleWeatherException(DioException e) {
  ErrorMessageModel errorMessageModel =
      ErrorMessageModel.fromJson(e.response!.data);
  return ServerFailure(
      message: errorMessageModel.message, code: errorMessageModel.code);
}
