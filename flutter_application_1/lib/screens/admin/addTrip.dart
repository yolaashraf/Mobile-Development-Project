import 'package:flutter/material.dart';
import '/widgets/date&time picker.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/widgets/custom_TextField.dart';

class AddTrip extends StatefulWidget {
  static String id = 'AddTrip';

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {

   String _tripName='' ;
   String _description='' ;
   String _price='' ; 
   String _tripId ='' ;
  
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                      width: 400,
                      height: 900,
                      // color: Colors.green,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/t.jpg"),
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
                  color: Color.fromARGB(255, 98, 191, 238),
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
                          color: Color.fromARGB(255, 252, 253, 254)),
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
              Positioned(
                  top: 240,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 252, 250, 250),
                    ),
                    width: 330,
                    height: 450,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Form(
                      key: _globalKey,
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CustomTextField(
                            // lable: 'Trip Name',
                            hint: 'Trip Name',
                            icon: Icons.hotel ,
                            onClick: (value) {
                              _tripName = value!;
                            },
                          ),
                          
                    
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            // lable: 'Trip Name',
                            hint: 'Trip ID',
                            icon: Icons.accessibility,
                            onClick: (value) {
                              _tripId = value!;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            // lable: 'Trip Name',
                            hint: 'Trip Description',
                            icon: Icons.description  ,
                            onClick: (value) {
                              _description = value!;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            // lable: 'Trip Name',
                            hint: 'Trip Price',
                            icon: Icons.price_check_outlined ,
                            onClick: (value) {
                              _price = value!;
                            },
                          ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    context.go('/AdminHome');
                                  },
                                  child: Text('Back')),

                              TextButton(
                                onPressed: (){
                                   if (_globalKey.currentState!.validate()) {
                                         _globalKey.currentState!.reset();

                                    }
                                },
                                child: Text('Add') 
                                       
                              ),
                            ]
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
