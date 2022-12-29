// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/historydata.dart';
import 'package:go_router/go_router.dart';
import '../../data/trip_details.dart';
import 'package:group_button/group_button.dart';
import '../../services/book_services.dart';
import 'package:d_info/d_info.dart';
import '../../services/trip_services.dart';

late String id;

class TripDetails extends StatefulWidget {
  TripDetails({
    Key? key,
    required this.tripid,
    required this.tripdescription,
    required this.triplocation,
    required this.tripname,
    required this.tripsdate,
    required this.edate,
    required this.pricee,
    // required this.tripimg
  }) : super(key: key);

  final tripid;
  final tripname;
  final triplocation;
  final tripdescription;
  final tripsdate;
  final edate;
  final pricee;

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  // List Tripinfo = data().historyData;

  Color colorr = Color.fromARGB(255, 193, 190, 190);

  bool pressed = false;

  Color textcolor = Colors.black;

  Color favcolor = Colors.black;

  bool favpressed = false;

  // List<bool> People = [false, false, false, false, false];

  Color BookColor = Color.fromARGB(255, 13, 71, 161);

  Text BookText = Text('Book Now');

  bool BookPress = true;

  int selectionCount = 0;

  // final tripimg;
  // final colorStateProvider = StateProvider<Color>((ref) => Colors.green);

  // final textStateProvider = StateProvider<Text>((ref) => Text('booked'));

  // ListView tripDetails = ListView(
  //   children: [],
  // );

  @override
  Widget build(BuildContext context) {
    // final currentuser = ref.watch(curentUserProvider);
    // final bookcolor = ref.watch(colorStateProvider);
    // final booktext = ref.watch(textStateProvider);
    return Scaffold(
      body: ListView(
        children: [
          Consumer(
            builder: (context, ref, child) {
              id = ref.watch(curentUserProvider).value!.userid;
              return Container();
            },
          ),
          Container(
            width: 50,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mountain.png"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.tripname,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(widget.pricee,
                  style: TextStyle(fontSize: 25, color: Colors.blue)),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
              ),
              Icon(Icons.location_pin),
              Text(
                widget.triplocation,
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Text("Start Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.tripsdate)
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Text(
                "End Date:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.edate),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Text(
                'People',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Text('Number of People in your group'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GroupButton(
            isRadio: true,
            controller: GroupButtonController(),
            onSelected: (index, b, isSelected) => selectionCount = b + 1,
            buttons: ["1", "2", "3", "4", "5"],
            maxSelected: 1,
            options: GroupButtonOptions(
                selectedColor: Colors.black,
                buttonHeight: 50,
                buttonWidth: 55,
                unselectedColor: Color.fromARGB(255, 223, 223, 223)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Text(
                'Description',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 20, 0, 0)),
              Container(
                width: 300,
                child: Text(
                  widget.tripdescription,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (favpressed == true) {
                      favcolor = Colors.black;
                      favpressed = false;
                    } else if (favpressed == false) {
                      favcolor = Colors.red;
                      favpressed = true;
                    }
                  });
                },
                child: Icon(Icons.favorite, size: 20.0, color: favcolor),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(237, 255, 255, 255)),
              ),
              Container(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectionCount == 0) {
                      DInfo.snackBarError(
                          context, 'Select number of people in your group');
                    } else {
                      Book_Service().bookNow(
                          tripName: widget.tripname,
                          price: widget.pricee,
                          peopleCount: selectionCount.toString(),
                          location: widget.triplocation,
                          description: widget.tripdescription,
                          userId: id,
                          tripId: widget.tripid,
                          startDate: widget.tripsdate,
                          endDate: widget.edate);
                      DInfo.snackBarSuccess(context, 'Booking Success');
                    }
                  },
                  child: Text('Book Now '),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[900]),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Trip Details'),
      ),
    );
  }
}
