import 'package:flutter/material.dart';
import '/widgets/date&time picker.dart';

class AddTrip extends StatefulWidget {
  static String id = 'AddTrip';

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  // String _name, _price, _description, _startdate, _enddate;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     //  resizeToAvoidBottomPadding: false,

  //     body: Form(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
  //         child: ListView(
  //           children: <Widget>[
  //             TextField("Trip_Name" , "Name" ,"Can't be empty"),

  //             SizedBox(
  //               height: 20,
  //             ),
  //             TextField("Trip_ID" , "ID" ,"Can't be empty"),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             TextField("Trip_Discription" , "Discription" ,"Can't be empty"),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             TextField("Trip_Price" , "Price" ,"Can't be empty"),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //                 children: [
  //                   Text(
  //                         'Start Date : ',
  //                         style: TextStyle( fontSize: 20),
  //                       ),

  //                   DateTimePicker(),
  //                 ]
  //             ),
  //              SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //                 children: [
  //                   Text(
  //                         'End Date : ',
  //                         style: TextStyle( fontSize: 20),
  //                       ),

  //                   DateTimePicker(),
  //                 ]
  //             ),
  //             SizedBox(
  //                 height: 10,
  //               ),
  //               // RaisedButton(
  //               //   onPressed: () {
  //               //     if (_globalKey.currentState.validate()) {
  //               //       _globalKey.currentState.save();

  //               //       _store.addTrip(Product(
  //               //           pName: _name,
  //               //           pPrice: _price,
  //               //           pDescription: _description,
  //               //           pLocation: _imageLocation,
  //               //           pCategory: _category));
  //               //     }
  //               //   },
  //               //   child: Text('Add Product'),
  //               // )
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                      width: 400,
                      height: 700,
                      // color: Colors.green,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/travel_plane_corona.png"),
                            fit: BoxFit.cover),
                      )),
                  // Container(
                  //   width: 400,
                  //   height: 310,
                  //   color: Colors.deepPurpleAccent,
                  // )
                ],
              ),
              Container(
                decoration: BoxDecoration(
    
                borderRadius: BorderRadius.all(Radius.circular(20)),
               color: Color.fromARGB(255, 238, 154, 111),

              ),
                width: 330,
                height: 510,
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add Trip',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 176, 221, 242)),
                    ),
                    // Text(
                    //   'New Trip',
                    //   style: TextStyle(
                    //       color: Colors.lightBlue,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.w300),
                    // ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
               Container(
                decoration: BoxDecoration(
    
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 240, 206, 190),

                ),
                 width: 330,
                height: 450,
                margin: EdgeInsets.only(bottom: 30),
                  child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField("Trip_Name", "Name", "Can't be empty"),

                    SizedBox(
                      height: 5,
                    ),
                    TextField("Trip_ID", "ID", "Can't be empty"),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                        "Trip_Discription", "Discription", "Can't be empty"),
                    SizedBox(
                      height: 5,
                    ),
                    TextField("Trip_Price", "Price", "Can't be empty"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Text(
                        'Start Date : ',
                        style: TextStyle(fontSize: 20),
                      ),
                      DateTimePicker(),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Text(
                        'End Date : ',
                        style: TextStyle(fontSize: 20),
                      ),
                      DateTimePicker(),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    // RaisedButton(
                    //   onPressed: () {
                    //     if (_globalKey.currentState.validate()) {
                    //       _globalKey.currentState.save();

                    //       _store.addTrip(Product(
                    //           pName: _name,
                    //           pPrice: _price,
                    //           pDescription: _description,
                    //           pLocation: _imageLocation,
                    //           pCategory: _category));
                    //     }
                    //   },
                    //   child: Text('Add Product'),

                    TextButton(onPressed: () {}, child: Text('Add')),
                  ],
                ),
               ),
            ],
          )
        ],
      ),
    );
  }
}

Widget TextField(label, hint, helper) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
       
      // maxLines: 5,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.cyan,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.flight,
          color: Colors.cyan,
        ),
        labelText: label,
        hintText: hint,
        helperText: helper,
      ),
    ),
  );
}
