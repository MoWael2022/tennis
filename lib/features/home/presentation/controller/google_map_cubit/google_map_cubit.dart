import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(InitMapState()) {
    checkServiceLocation();
  }

  late GoogleMapController googleMapController;
  final TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {};
  LatLng currentPosition = const LatLng(31.19875356217708, 29.910957993977597);


  Future<BitmapDescriptor> _getMarkerIconFromUrl(String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return BitmapDescriptor.bytes(response.bodyBytes);
    } else {
      return BitmapDescriptor.defaultMarker;
    }
  }

  Future<void> getWeatherStateMarker(
      LatLng latLang, String imageUrl) async {
    BitmapDescriptor markerIcon = await _getMarkerIconFromUrl(imageUrl);
    final marker = {
      Marker(
        draggable: false,
        markerId: const MarkerId("1"),
        position: latLang,
        icon: markerIcon, // Use the network image as the icon
      ),
    };
    emit(LoadedMarkerState(marker));
  }

  Future<Position> getCurrentLocation() async {
    Position myPosition =
        await Geolocator.getCurrentPosition().then((value) => value);
    currentPosition = LatLng(myPosition.latitude, myPosition.longitude);
    return myPosition;
  }

  Future<String> getCurrentCountryName() async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    if (placeMarks.isNotEmpty) {
      String country = placeMarks.first.administrativeArea ?? 'Unknown Country';
      return country;
    }
    return "UnKnown Country";
  }

  checkServiceLocation() async {
    bool serviceLocation = await Geolocator.isLocationServiceEnabled();
    //print(serviceLocation);

    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      Geolocator.requestPermission();
    }
    if(serviceLocation) {
      emit(CheckLocationState());
    }
  }

  Future<void> searchLocation(String place) async {
    try {
      List<Location> locations = await locationFromAddress(place);
      if (locations.isNotEmpty) {
        final Location location = locations.first;
        LatLng latLng = LatLng(location.latitude, location.longitude);
        googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(latLng, 13),
        );
      } else {
        print('Location not found');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Location not found')),
        // );
      }
    } catch (e) {
      print('Error searching location ');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Error searching location')),
      // );
    }
  }
}
