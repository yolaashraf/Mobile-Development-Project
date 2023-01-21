import 'package:flutter_application_1/model/trip.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocationController {
  UserLocationController() {
    determinePosition();
  }

  Position? userLoc;

  Future<Position> determinePosition() async {
    print("Get location started");
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    userLoc = await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }

  getMarkers(List<Trip>? trips) { //trips dah nullable
    List<Marker> markers = [];
    for (int i = 0; i < trips!.length; i++) {
      markers.add(
        Marker(  //built-in class inside google maps lib
            markerId: MarkerId("${trips[i].location}"),
            infoWindow: InfoWindow(title: "${trips[i].location}"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position:
                LatLng(trips[i].latlng.latitude, trips[i].latlng.longitude)),
      );
    }
    return markers;
  }
}
