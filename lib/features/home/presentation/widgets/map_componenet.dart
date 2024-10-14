import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/home/presentation/widgets/google_map.dart';

import '../controller/google_map_cubit/google_map_cubit.dart';
import '../controller/google_map_cubit/google_map_state.dart';
import '../controller/weather_cubit/weather_cubit.dart';
import '../controller/weather_cubit/weather_state.dart';

class GoogleMapComponent extends StatelessWidget {
  const GoogleMapComponent(
      {super.key,
      required this.isNeedController,
      required this.initialPosition,
      required this.zooming});

  final double zooming;
  final LatLng initialPosition;
  final bool isNeedController;

  @override
  Widget build(BuildContext context) {
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    final googleMapCubit = BlocProvider.of<GoogleMapCubit>(context);
    return Center(
      child: SizedBox(
        width: 90.w,
        height: 40.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FutureBuilder<Position>(
            future: googleMapCubit.getCurrentLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Future.microtask(() {
                  googleMapCubit.googleMapController.animateCamera(
                    CameraUpdate.newLatLngZoom(
                        LatLng(
                            snapshot.data!.latitude, snapshot.data!.longitude),
                        13),
                  );
                });
              }
              return BlocConsumer<WeatherCubit, WeatherState>(
                  listener: (context, state) async {
                if (state is LoadingWeatherDataState) {
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (BuildContext context) {
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   },
                  // );
                }
                if (state is LoadedWeatherDataState) {
                  googleMapCubit.googleMapController.animateCamera(
                    CameraUpdate.newLatLngZoom(
                        LatLng(state.data.latitude, state.data.longitude), 13),
                  );
                  //Navigator.pop(context);
                  weatherCubit.loadData = true;
                  weatherCubit.currentWeatherData = state.data;
                  await googleMapCubit.getWeatherStateMarker(
                      LatLng(state.data.latitude, state.data.longitude),
                      state.data.conditionImage);
                }
                if (state is ErrorWeatherDataState) {
                  print(state.message);
                }
              }, builder: (context, state) {
                return BlocConsumer<GoogleMapCubit, GoogleMapState>(
                    listener: (context, googleMapState) {
                  if (googleMapState is LoadedMarkerState) {
                    googleMapCubit.markers = googleMapState.markers;
                  }
                }, builder: (context, state) {
                  return GoogleMapWidget(
                    zooming: zooming,
                    initialPosition: initialPosition,
                    isNeedController: isNeedController,
                  );
                  // GoogleMap(
                  //   markers: googleMapCubit.markers,
                  //   initialCameraPosition: CameraPosition(
                  //     target: googleMapCubit.currentPosition,
                  //   ),
                  //   onMapCreated: (controller) {
                  //     googleMapCubit.googleMapController =
                  //         controller;
                  //   },
                  // );
                });
              });
            },
          ),
        ),
      ),
    );
  }
}
