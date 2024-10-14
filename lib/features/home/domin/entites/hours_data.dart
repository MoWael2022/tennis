import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class HoursData extends Equatable {
  final String _time;

  final double temp;

  final String condition;

  final String _conditionImage;

  String get conditionImage => _conditionImage.startsWith('https:')
      ? _conditionImage
      : 'https:$_conditionImage';

  String get time {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(_time);
    return DateFormat("HH:mm").format(dateTime);
  }

  const HoursData(
      {required this.temp,
      required this.condition,
      required String conditionImage,
      required String time})
      : _conditionImage = conditionImage,
        _time = time;

  @override
  List<Object?> get props => [
        time,
        temp,
        conditionImage,
        condition,
      ];
}
