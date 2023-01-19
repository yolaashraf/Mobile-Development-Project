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
import '../../services/fav_services.dart';

final favItemStateProvider = StateProvider<List<String>>(
  (ref) {
    List<String>? ids = [''];
    return ids;
  },
);
// late String userid;

class TripDetails extends ConsumerStatefulWidget {
  TripDetails({
    Key? key,
    required this.tripid,
    required this.tripdescription,
    required this.triplocation,
    required this.tripname,
    required this.tripsdate,
    required this.edate,
    required this.pricee,
    required this.img,
    // required this.fav,
    // required this.tripimg
  }) : super(key: key);

  final tripid;
  final tripname;
  final triplocation;
  final tripdescription;
  final tripsdate;
  final edate;
  final pricee;
  late String favid;
  String img;
  // final fav;

  @override
  ConsumerState<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends ConsumerState<TripDetails> {
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
  // late var id;

  // final tripimg;
  // final colorStateProvider = StateProvider<Color>((ref) => Colors.green);

  // final textStateProvider = StateProvider<Text>((ref) => Text('booked'));

  // ListView tripDetails = ListView(
  //   children: [],
  // );

  @override
  Widget build(BuildContext context) {
    // setState(() {
    if (ref.watch(favItemStateProvider).contains(widget.tripid)) {
      favcolor = Colors.red;
    } else if (!ref.watch(favItemStateProvider).contains(widget.tripid)) {
      favcolor = Colors.black;
    }
    // });
    return Scaffold(
      body: ListView(
        children: [
          Consumer(
            builder: (context, ref, child) {
              // userid = ref.watch(curentUserProvider).value!.userid;
              return Container();
            },
          ),
          Container(
            width: 50,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/mountain.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    if (favcolor == Colors.red) {
                      print('HEREEE');

                      var allfavs = Fav_Service().viewAllFav(
                          ref.watch(curentUserProvider).value!.userid);

                      allfavs.forEach((favs) {
                        // print(favs);
                        if (!favs.isEmpty) {
                          // print(favs.length.toString());
                          favs.forEach((fav) {
                            // print('hr;ll');
                            if (fav.tripId == widget.tripid &&
                                fav.userId ==
                                    ref
                                        .watch(curentUserProvider)
                                        .value!
                                        .userid) {
                              widget.favid = fav.favId;
                              // print(fav.favId);
                            }
                          });
                          print("iddd " + widget.favid);
                        }
                      });
                      Fav_Service().removeFav(widget.favid);

                      ref.watch(favItemStateProvider).remove(widget.tripid);
                      // Fav_Service().delete(favId);
                      // ref.watch(favItemStateProvider).clear();
                      favcolor = Colors.black;
                    } else if (favcolor == Colors.black) {
                      ref.watch(favItemStateProvider).add(widget.tripid);

                      Fav_Service().AddFav(
                          tripId: widget.tripid,
                          userId: ref.watch(curentUserProvider).value!.userid,
                          tripName: widget.tripname,
                          eDate: widget.edate,
                          price: widget.pricee,
                          sDate: widget.tripsdate,
                          tripdescription: widget.tripdescription,
                          triplocation: widget.triplocation,
                          tripImg: widget.img.toString().replaceAll("-", "/"));
                      print("anaa henaa");
                      favpressed = true;

                      favcolor = Colors.red;
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
                          userId: ref.watch(curentUserProvider).value!.userid,
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
