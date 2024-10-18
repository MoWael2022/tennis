import 'package:equatable/equatable.dart';

class WeatherPredictionDataReturned extends Equatable {
  final int prediction ;
  const WeatherPredictionDataReturned({required this.prediction});

  @override
  List<Object?> get props => [prediction];


}