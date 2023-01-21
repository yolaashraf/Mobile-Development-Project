import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/trip.dart';
import 'package:flutter_application_1/widgets/trip_row_wigdet.dart';

class TripWidget extends StatelessWidget {
  List<Trip> allTrips;
  int index;
  double distance;
  TripWidget({
    required this.allTrips,
    required this.index,
    required this.distance,
  });
  @override
  Widget build(BuildContext context) {
    print(allTrips[index].latlng);
    return Column(
      children: [
        customeRow(
            imgpath: allTrips[index].img,
            triplocation: allTrips[index].location,
            sDate: allTrips[index].startDate,
            eDate: allTrips[index].endDate,
            tripid: allTrips[index].tripid,
            price: allTrips[index].price,
            tripdescription: allTrips[index].description,
            tripname: allTrips[index].tripName),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            
              Text("Distance:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("${distance.toStringAsFixed(2)} KM",style: TextStyle(fontSize: 25),),
            ],),
            Divider(thickness: 3,),
      ],
    );
  }
}
