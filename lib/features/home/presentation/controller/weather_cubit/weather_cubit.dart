import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/service_locator/service_locator.dart';
import 'package:weather_app/features/home/domin/entites/weather_data.dart';
import 'package:weather_app/features/home/domin/usecase/get_weather_data_usecase.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit():super(InitState());

  bool loadData = false ;
  WeatherData? currentWeatherData ;
  final ScrollController scrollController = ScrollController();

  getWeatherData(String countryName)async{
    emit(LoadingWeatherDataState());
    final result = instance<GetWeatherDataUseCase>();
    final data = await result.call(countryName);
    data.fold((l){
      emit(ErrorWeatherDataState(l.message));
    }, (r){
      int currentTimeIndex = r.hours.indexWhere(
            (hour) => hour.time.substring(0, 2) == r.formattedTime.substring(0, 2),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (currentTimeIndex != -1) {
          double offset = (currentTimeIndex * 27.w) - (100.w / 2) + (27.w / 2);
          scrollController.jumpTo(offset);
        }
      });
      emit(LoadedWeatherDataState(r));
    });
  }

}