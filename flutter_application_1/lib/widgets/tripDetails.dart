import 'package:flutter/material.dart';
import '../data/historydata.dart';
import 'package:go_router/go_router.dart';
import '../data/trip_details.dart';
import 'package:group_button/group_button.dart';

class TripDetails extends StatefulWidget {
  TripDetails({Key? key}) : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  List Tripinfo = data().historyData;
  Color colorr = Color.fromARGB(255, 193, 190, 190);
  bool pressed = false;
  Color textcolor = Colors.black;
  Color favcolor = Colors.black;
  bool favpressed = false;
  List<bool> People = [false, false, false, false, false];

  ListView tripDetails = ListView(
    children: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
                'Yosemite',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text('200 LE',
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
                'USA,Georgia',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 0, 0)),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              )
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
            onSelected: (index, b, isSelected) => print(b),
            buttons: ["1", "2", "3", "4", "5"],
            maxSelected: 1,
            options: GroupButtonOptions(
              selectedColor: Colors.black,
              selectedBorderColor: Colors.grey[300],
              buttonHeight: 50,
              buttonWidth: 55,
            ),
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
                  'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text',
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
                    primary: Color.fromARGB(237, 255, 255, 255)),
              ),
              Container(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
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
