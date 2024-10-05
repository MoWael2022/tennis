import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GoogleMapState {}

class InitMapState extends GoogleMapState{}

class LoadedMarkerState extends GoogleMapState{
  Set<Marker> markers ={};
  LoadedMarkerState(this.markers);
}