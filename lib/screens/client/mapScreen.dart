import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/services/getUserLocation.dart';
import 'package:flutter_application_1/widgets/trip_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/trip.dart';
import '../../services/trip_services.dart';
import 'dart:math' show cos, sqrt, asin;

class MapScreen extends StatefulWidget { 
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer<
      GoogleMapController>(); //dah controller for google maps , completer is controller bn complete beh el
  //map controller

  UserLocationController userLocationController =
      UserLocationController(); //userlocation dah class inside getuserlocation(controller)

  Position? userCurrentLoc;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override //deh bs 3shan el stateful w 7tenaha 3shan azwd hagat fel init state
  void initState() {
    //runs when i build
    userLocationController.determinePosition().then((value) {
      //get user postion from the controller
      userCurrentLoc = userLocationController.userLoc!; //assign location to variable in the screen
      setState(() {}); //to change state of the current location
      print('User location: $userCurrentLoc');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.4,
            child: StreamBuilder<List<Trip>>(  //strem type bta3na list of trips 
                stream: Trip_Service().viewTrips(),  //stream data (snapshot)
                builder: (context, snapshot) {   //builder to build google map w lazm builder 3shan stream builder
                  if (snapshot.hasData) {
                    return GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(30.055701, 31.221781), zoom: 8),
                        myLocationEnabled: true,
                        onMapCreated: (controller) =>
                            _controller.complete(controller),
                        markers: userLocationController.getMarkers(snapshot.data).toSet());//return the value that come in list then convert it to set
                  } else {
                    return const Center(child: CircularProgressIndicator()); //if data can't be loaded
                  }
                }),
          ),
          Expanded(
            child: StreamBuilder<List<Trip>>(
              stream: Trip_Service().viewTrips(),
              builder: (context, snapshot) {
                if (userCurrentLoc == null) {
                  return const Center(child: CircularProgressIndicator()); // Loading if current location not assigned yet
                }
                if (snapshot.hasData) {
                  final allTrips = snapshot.data!; // bn7ot kool el data elly hya el trips fe var esmo all trips
                  allTrips.sort(((a, b) => //sort btakhod el list w t3mlha sorting 3ala hasab el comparing elly ana 3amlo 
                      calculateDistance(
                              a.latlng.latitude,
                              a.latlng.longitude,
                              userCurrentLoc!.latitude,
                              userCurrentLoc!.longitude)
                          .toInt()
                          .compareTo(calculateDistance(
                                  b.latlng.latitude,
                                  b.latlng.longitude,
                                  userCurrentLoc!.latitude,
                                  userCurrentLoc!.longitude)
                              .toInt()))); //3shan el function bta3t el sort btakhod function compareTo w no3ha int fa bn7wlha l int 3shan a3raf a3ml compare 3shan distance method el return bta3ha double
                  allTrips.forEach((element) {
                    print("Element orderd: ${element.location}");
                  });
                  return ListView.builder( //leeh builder 3shan ehna han build item item 3ala hasab el item count w 3ala 7asab el item builder 
                      itemCount: allTrips.length,
                      itemBuilder: (context, index) {
                        return TripWidget(
                          allTrips: allTrips,
                          index: index,
                          distance: calculateDistance(
                            allTrips[index].latlng.latitude,
                            allTrips[index].latlng.longitude,
                            userCurrentLoc!.latitude,
                            userCurrentLoc!.longitude,
                          ),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final GoogleMapController controller = await _controller.future;
      //     Position userLoc = await loc.determinePosition();
      //     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(userLoc.latitude,userLoc.longitude))));
      //   },
      // ),
    );
  }
}
