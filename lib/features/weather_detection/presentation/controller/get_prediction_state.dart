import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_returned.dart';

abstract class GetPredictionState {}

class InitState extends GetPredictionState {}
class PredictionLoadingState extends GetPredictionState{}

class PredictionLoadedState extends GetPredictionState{
  String data;
  String lottie;
  PredictionLoadedState(this.data,this.lottie);
}

class PredictionErrorState extends GetPredictionState{
  String messageError;
  PredictionErrorState(this.messageError);
}