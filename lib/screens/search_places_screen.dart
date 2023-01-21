import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
// class SearchPlaces extends StatefulWidget {
//   const SearchPlaces({super.key});

//   @override
//   State<SearchPlaces> createState() => _SearchPlacesState();
// }

// class _SearchPlacesState extends State<SearchPlaces> {
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//         initialCameraPosition: CameraPosition(
//       target: LatLng(37.43296265331129, -122.08832357078792),
//     ));
//     // return Column();
//   }
// }

class SearchPLaceScreen extends StatefulWidget {
  const SearchPLaceScreen({super.key});

  @override
  State<SearchPLaceScreen> createState() => _SearchPLaceScreenState();
}

const kGoogleApiKey = '';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPLaceScreenState extends State<SearchPLaceScreen> {
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792), zoom: 14.0);
  Set<Marker> markerList = {};
  late GoogleMapController googleMapConroller;
  final Mode _mode = Mode.overlay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markerList,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapConroller = controller;
          },
        ),
        ElevatedButton(
            onPressed: _handlePressedButton, child: Text('Search Places'))
      ]),
      appBar: AppBar(title: Text('Search Screen')),
    );
  }

  Future<void> _handlePressedButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country, "pk")]);

    displayPrediction(p!, homeScaffoldKey.currentContext);
  }

  void onError(PlacesAutocompleteResponse respose) {
    // homeScaffoldKey.currentState!
    //     .showSnackBar(SnackBar(content: Text(respose.errorMessage!)));
  }

  Future<void> displayPrediction(
      Prediction p, BuildContext? currentContext) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markerList.clear();
    markerList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    setState(() {
      googleMapConroller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
    });
  }
}
