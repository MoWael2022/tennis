import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/routers/routers.dart';
import 'package:weather_app/features/auth/presentation/controller/user_cubit/user_state.dart';
import 'package:weather_app/features/home/presentation/controller/google_map_cubit/google_map_cubit.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_state.dart';
import 'package:weather_app/features/home/presentation/widgets/map_componenet.dart';

import '../../../auth/presentation/controller/user_cubit/user_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    final googleMapCubit = BlocProvider.of<GoogleMapCubit>(context);
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    final navigation = Navigator.of(context);
    final userCubit = BlocProvider.of<UserCubit>(context);

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hallo",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 28.sp,
                  ),
                ),
                BlocBuilder<UserCubit, UserDataState>(
                    builder: (context, state) {
                  if (state is LoadingUserData) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    userCubit.userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: TextFormField(
              controller: googleMapCubit.searchController,
              decoration: InputDecoration(
                hintText: 'Enter country or town name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    googleMapCubit
                        .searchLocation(googleMapCubit.searchController.text);
                  },
                ),
              ),
            ),
          ),
          const GoogleMapComponent(
            zooming: 0,
            initialPosition: LatLng(31.19875356217708, 29.910957993977597),
            isNeedController: true,
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: SizedBox(
              width: 60.w,
              height: 7.h,
              child: ElevatedButton(
                onPressed: () async {
                  String country;
                  if (googleMapCubit.searchController.text.isEmpty) {
                    country = await googleMapCubit.getCurrentCountryName();
                  } else {
                    country = googleMapCubit.searchController.text;
                  }
                  weatherCubit.getWeatherData(country);
                },
                child: const Text("Check Weather"),
              ),
            ),
          ),
          SizedBox(height: 7.h),
          BlocConsumer<WeatherCubit, WeatherState>(listener: (context, state) {
            if (state is LoadingWeatherDataState) {
              opacity = 0;
            } else if (state is LoadedWeatherDataState) {
              opacity = 1;
            }
          }, builder: (context, state) {
            if (state is LoadingWeatherDataState) {
              return  SizedBox(
                height: 3.h,
                width: 3.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is LoadedWeatherDataState) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                        height: 26.h,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInQuart,
                          tween: Tween(begin: 0.0, end: 1.0),
                          builder: (context, opacity, child) {
                            return Opacity(
                              opacity: opacity,
                              child: Container(
                                margin: EdgeInsets.all(10.sp),
                                color: Colors.white24,
                                height: 26.h,
                                child: Padding(
                                  padding: EdgeInsets.all(15.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            weatherCubit
                                                .currentWeatherData!.name,
                                            style: TextStyle(
                                              color: Colors.blue.shade900,
                                              fontSize: 26.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Image.network(
                                            weatherCubit.currentWeatherData!
                                                .conditionImage,
                                            width: 15.w,
                                            height: 20.sp,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        weatherCubit.currentWeatherData!.temp
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.sp),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            weatherCubit
                                                .currentWeatherData!.condition,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              navigation.pushNamed(
                                                  Routers.weatherScreen);
                                              weatherCubit.getCurrentTime(state.data);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.sp,
                                                  horizontal: 20.sp),
                                            ),
                                            child: const Text("Know More"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.sp),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
