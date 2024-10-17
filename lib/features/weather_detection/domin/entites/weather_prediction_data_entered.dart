import 'package:equatable/equatable.dart';

class WeatherPredictionDataEnter extends Equatable {
  final List<int> weatherPredictionData;

  const WeatherPredictionDataEnter({required this.weatherPredictionData});

  @override
  List<Object?> get props => [weatherPredictionData];

  Map<String, dynamic> toJson() {
    return {
      "features": weatherPredictionData,
    };
  }
}
