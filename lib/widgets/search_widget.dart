import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/trip.dart';
import '../services/trip_services.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  var allTrips = Trip_Service().viewTrips();
  // late List<Trip> myTrips;
  // get() {
  //   allTrips.map((trips) {
  //     trips.map((trip) {
  //       myTrips.add(trip);
  //     });
  //   });
  // }

  // List<String> searchTerms = [
  //   "Apple",
  //   "Banana",
  //   "Mango",
  //   "Pear",
  //   "Watermelons",
  //   "Blueberries",
  //   "Pineapples",
  //   "Strawberries"
  // ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    allTrips.forEach((trips) {
      trips.forEach((trip) {
        print('mariomaaa');
        if (trip.tripName.toLowerCase().contains(query.toLowerCase())) {
          print('herrrrreeeee');
          matchQuery.add(trip.tripName);
        }
      });
    });

    return StreamBuilder<List<Trip>>(
      stream: Trip_Service().viewTrips(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allTrips = snapshot.data!;

          return ListView.builder(
              itemCount: allTrips.length,
              itemBuilder: (context, index) {
                // return myWidget(allTrips, index);

                var result = allTrips[index].tripName;
                return ListTile(
                  title: Text(result),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    // allTrips.forEach((trips) {
    //   print("lengthhhh checkkkkkk   " + trips.length.toString());

    //   trips.forEach((trip) {
    //     print("heree length");
    //     if (trip.tripName.toLowerCase().contains(query.toLowerCase())) {
    //       print("inside");
    //       print(trip.tripName.toString());
    //       matchQuery.add(trip.tripName.toString());
    //     }
    //     // matchQuery!.add('trip.tripName');
    //   });
    //   print("Queryy lengthh checkk    " + matchQuery.toString());
    // });

    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    return StreamBuilder<List<Trip>>(
      stream: Trip_Service().viewTrips(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allTrips = snapshot.data!;
          return ListView.builder(
              itemCount: allTrips.length,
              itemBuilder: (context, index) {
                var result = '';
                if (allTrips[index]
                    .tripName
                    .toLowerCase()
                    .contains(query.toLowerCase())) {
                  result = allTrips[index].tripName;
                }

                // return myWidget(allTrips, index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              // padding: const EdgeInsets.all(2.0),
                              textStyle: const TextStyle(fontSize: 17),
                            ),
                            child: Text(result, textAlign: TextAlign.left),
                            onPressed: () {
                              context.go(
                                  '/TripDetails/${allTrips[index].tripid}/${allTrips[index].description}/${allTrips[index].price}/${allTrips[index].location}}/${allTrips[index].tripName}/${allTrips[index].startDate}}/${allTrips[index].endDate}}/${allTrips[index].img.replaceAll("/", "-")}');
                            }),
                      ],
                    )
                  ],
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
