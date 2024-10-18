import 'package:bloc/bloc.dart';
import 'package:weather_app/core/constant/image_path_manager.dart';
import 'package:weather_app/core/service_locator/service_locator.dart';
import 'package:weather_app/core/utilies/string_manager.dart';
import 'package:weather_app/features/weather_detection/domin/entites/weather_prediction_data_entered.dart';
import 'package:weather_app/features/weather_detection/presentation/controller/get_prediction_state.dart';

import '../../domin/usecase/get_prediction_usecase.dart';

class GetPredictionCubit extends Cubit<GetPredictionState> {
  GetPredictionCubit() : super(InitState());

  getPrediction(List<int> input) async {
    emit(PredictionLoadingState());
    final result = instance<GetPredictionUseCase>();
    final data = await result
        .execute(WeatherPredictionDataEnter(weatherPredictionData: input));
    data.fold((l) {
      emit(PredictionErrorState(l.message));
    }, (r) {
      if (r.prediction == 1) {
        emit(PredictionLoadedState(
            StringManager.goodWeather, ImagePathManager.goodWeather));
      } else {
        emit(PredictionLoadedState(
            StringManager.badWeather, ImagePathManager.badWeather));
      }
    });
  }
}
