import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/admin/edit_trip.dart';
import 'package:go_router/go_router.dart';

class adminTripsView extends StatefulWidget {
  final String TripName;
  final String price;
  final String location;
  final String sDate;
  final String eDate;
  final String description;
  final String tripId;
  // final String state;

  adminTripsView(
      {Key? key,
      required this.TripName,
      required this.price,
      required this.location,
      required this.sDate,
      required this.eDate,
      required this.description,
      required this.tripId})
      : super(key: key);

  // const adminTripsView({super.key});

  @override
  State<adminTripsView> createState() => _adminTripsViewState();
}

class _adminTripsViewState extends State<adminTripsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      color: Color.fromARGB(255, 237, 237, 237),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.TripName}',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text("Start Date: " + widget.sDate),
                Text("End Date: " + widget.eDate),
                Text("Location: " + widget.location),
                Text("Price: " + widget.price),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding(padding: EdgeInsets.fromLTRB(50, 20, 0, 0)),
                    Container(
                      width: 300,
                      child: Text(
                        widget.description,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
                // Text(widget.description),
              ]),
          // SizedBox(
          //   width: 50,
          // ),
          Container(
              child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.go('/DeleteTrip');
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditTrip(
                              TripName: widget.TripName,
                              description: widget.description,
                              eDate: widget.eDate,
                              location: widget.location,
                              price: widget.price,
                              sDate: widget.sDate,
                              tripId: widget.tripId,
                            )));
                    // context.go('/EditTrip');
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.green,
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
