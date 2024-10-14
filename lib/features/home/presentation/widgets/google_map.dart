import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/features/home/presentation/controller/google_map_cubit/google_map_cubit.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key,required this.initialPosition,required this.isNeedController,required this.zooming});
  final LatLng initialPosition;
  final bool isNeedController;
  final double zooming;
  @override
  Widget build(BuildContext context) {

    return GoogleMap(
      markers:  BlocProvider
          .of<GoogleMapCubit>(context).markers,
      initialCameraPosition: CameraPosition(
        zoom: zooming,
        target: initialPosition,
      ),
      onMapCreated: (controller) {
        if(isNeedController) {
          BlocProvider
              .of<GoogleMapCubit>(context)
              .googleMapController =
              controller;
        }
      },
    );;
  }
}
