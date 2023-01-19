import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/trip_services.dart';
import '../model/trip.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'trip_row_wigdet.dart';
import 'package:go_router/go_router.dart';

class homeWidget extends StatefulWidget {
  const homeWidget({super.key});

  @override
  State<homeWidget> createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {
  Widget myWidget(allTrips, index) {
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
            tripname: allTrips[index].tripName)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 20),
            Text(
              'Up Comming Events',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
          ],
        ),
        Flexible(
            child: StreamBuilder<List<Trip>>(
          stream: Trip_Service().viewTrips(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final allTrips = snapshot.data!;
              return ListView.builder(
                  itemCount: allTrips.length,
                  itemBuilder: (context, index) {
                    return myWidget(allTrips, index);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ))
      ],
    );
  }
}
