import 'package:equatable/equatable.dart';

class DaysData extends Equatable {
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String time;
  final String condition;
  final String _conditionImage;
  final int humidity;
  final double windSpeed;

  String get conditionImage => _conditionImage.startsWith('https:')
      ? _conditionImage
      : 'https:$_conditionImage';

  const DaysData(
      {required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.time,
      required this.condition,
      required String conditionImage,
      required this.humidity,
      required this.windSpeed})
      : _conditionImage = conditionImage;

  @override
  List<Object?> get props => [
        condition,
        conditionImage,
        time,
        temp,
        minTemp,
        maxTemp,
        windSpeed,
        humidity,
      ];
}
