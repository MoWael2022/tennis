import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/home/presentation/controller/google_map_cubit/google_map_cubit.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_state.dart';

import '../widgets/map_componenet.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0B043F),

      body: SafeArea(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is LoadedWeatherDataState) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          weatherCubit.currentWeatherData!.name,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weatherCubit.currentWeatherData!.temp.toString()}°C",
                          style: const TextStyle(
                            fontSize: 42,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weatherCubit.currentWeatherData!.condition,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildWeatherInfo("Temp",
                                "${weatherCubit.currentWeatherData!.temp}°C"),
                            _buildWeatherInfo("Min Temp",
                                "${weatherCubit.currentWeatherData!.minTemp}°C"),
                            _buildWeatherInfo("Max Temp",
                                "${weatherCubit.currentWeatherData!.maxTemp} °C"),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildWeatherInfo("Humidity",
                                "${weatherCubit.currentWeatherData!.humidity}%"),
                            _buildWeatherInfo("Wind MPH",
                                "${weatherCubit.currentWeatherData!.windMph} mph"),
                            _buildWeatherInfo("Wind Dir",
                                weatherCubit.currentWeatherData!.windDir),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 21.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: weatherCubit.scrollController,
                        itemCount:
                            weatherCubit.currentWeatherData!.hours.length,
                        itemBuilder: (context, index) {
                          bool currentTime = weatherCubit
                                  .currentWeatherData!.hours[index].time
                                  .substring(0, 2) ==
                              weatherCubit.currentWeatherData!.formattedTime
                                  .substring(0, 2);
                          return SizedBox(
                            width: 27.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.w, right: 2.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: currentTime
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: currentTime
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(.5.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        weatherCubit.currentWeatherData!
                                            .hours[index].time,
                                        style: TextStyle(fontSize: 17.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                        child: Image.network(weatherCubit
                                            .currentWeatherData!
                                            .hours[index]
                                            .conditionImage),
                                      ),
                                      Text(
                                        weatherCubit.currentWeatherData!
                                            .hours[index].condition,
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  // Google Map
                  GoogleMapComponent(
                    zooming: 13,
                    initialPosition:
                        LatLng(state.data.latitude, state.data.longitude),
                    isNeedController: false,
                  ),
                  SizedBox(height: 5.h),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '3-Day Forecast',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.data.days.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white24,
                            elevation: 5, // Add elevation for shadow effect
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // Rounded corners
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.data.days[index].time,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Image.network(
                                    state.data.days[index].conditionImage,
                                    height: 7.h,
                                    width: 15.w,
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    state.data.days[index].condition,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.yellowAccent,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  _buildWeatherDetail('Temperature:',
                                      state.data.days[index].temp.toString()),
                                  _buildWeatherDetail(
                                      'Max Temp:',
                                      state.data.days[index].maxTemp
                                          .toString()),
                                  _buildWeatherDetail(
                                      'Min Temp:',
                                      state.data.days[index].minTemp
                                          .toString()),
                                  _buildWeatherDetail(
                                      'Humidity:',
                                      state.data.days[index].humidity
                                          .toString()),
                                  _buildWeatherDetail(
                                      'Wind Speed:',
                                      state.data.days[index].windSpeed
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.white54,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherInfo(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white54, fontSize: 16),
        ),
      ],
    );
  }
}
