import 'package:flutter/material.dart';
import '/widgets/date&time picker.dart';
import '/widgets/end date&time picker.dart';
import '../../services/trip_services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/widgets/custom_TextField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AddTrip extends ConsumerStatefulWidget {
  AddTrip({Key? key}) : super(key: key);

  static String id = 'AddTrip';


  @override
  ConsumerState<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends ConsumerState<AddTrip> {
  



   final tripNameController=TextEditingController() ;
   final descriptionController=TextEditingController() ;
   final priceController=TextEditingController(); 
   final tripIdController =TextEditingController() ;
   final imageLocationController=TextEditingController();
   final locationController=TextEditingController();
  //     final endDController=TextEditingController();
  //  final starDController=TextEditingController();

  //  List<Widget> _eDate=[];
  //  DateTime _sDate=DateTime.now();
  
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); 


  // setState((){
  //   print('hj');
  // });

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
                            controller:tripNameController, 
                            ot: false ,
                            // lable: 'Trip Name',
                            hint: 'Trip Name',
                            icon: Icons.hotel ,
                            // onClick: (value) {
                            //   _tripName = value!;
                            // },
                          ),
                          
                    
                          SizedBox(
                            height: 5,
                          ),
                          // CustomTextField(
                          //   controller:tripIdController,
                          //   // lable: 'Trip Name',
                          //   hint: 'Trip ID',
                          //   icon: Icons.accessibility,
                          //   // onClick: (value) {
                          //   //   _tripId = value!;
                          //   // },
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          CustomTextField(
                            controller:descriptionController, 
                            ot: false ,
                            // lable: 'Trip Name',
                            hint: 'Trip Description',
                            icon: Icons.description  ,
                            // onClick: (value) {
                            //   _description = value!;
                            // },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            controller:priceController, 
                            ot: false ,
                            // lable: 'Trip Name',
                            hint: 'Trip Price',
                            icon: Icons.price_check_outlined ,
                            // onClick: (value) {
                            //   _price = value!;
                            // },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            controller:imageLocationController, 
                            ot: false ,
                            // onClick: (value) {
                            //   _imageLocation = value!;
                            // },
                            hint: 'Trip image Location',
                            icon: Icons.image ,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            controller:locationController, 
                            ot: false ,
                            // onClick: (value) {
                            //   _location = value!;
                            // },
                            hint: 'Trip  Location',
                            icon: Icons.location_city ,
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
                            
                            // Text(),
                            
                            
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text(
                              'End Date : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            eDateTimePicker(),
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          
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
                                         

                                         final String newName=tripNameController.text;
                                         final String newDescription=descriptionController.text;
                                         final String newPrice=priceController.text;
                                         final String newImage=imageLocationController.text;
                                         final String newLocation=locationController.text;

                                         Trip_Service().AddTrip(
                                              tripName: newName,
                                              endDate: ref.watch(edateProvider).toString(),
                                              price: newPrice,
                                              startDate:ref.watch(dateProvider).toString(),
                                              description: newDescription,
                                               img: newImage,
                                              location:newLocation,
                                              // 
                                              );
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
