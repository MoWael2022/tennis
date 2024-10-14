import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/domin/entites/day_data.dart';
import 'package:weather_app/features/home/domin/entites/hours_data.dart';

class WeatherData extends Equatable {
  final String name;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final dynamic condition;
  final dynamic _conditionImage;
  final List<HoursData> hours;
  final List<DaysData> days;
  final double latitude;
  final double longitude;
  final int humidity;
  final double windMph;
  final String windDir;
  final String _time;

  String get conditionImage => _conditionImage.startsWith('https:')
      ? _conditionImage
      : 'https:$_conditionImage';

  String get date {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(_time);
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  String get formattedTime {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(_time);
    return DateFormat("HH:mm").format(dateTime);
  }

  const WeatherData(
      {required this.latitude,
      required this.longitude,
      required this.humidity,
      required this.windMph,
      required this.windDir,
      required this.name,
      required String conditionImage,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.condition,
      required String time,
      required this.hours,
      required this.days})
      : _conditionImage = conditionImage,
        _time = time;

  @override
  List<Object?> get props => [
        name,
        temp,
        maxTemp,
        minTemp,
        conditionImage,
        condition,
        _time,
        hours,
        days,
      ];
}
