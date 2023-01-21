import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/custom_TextField.dart';
import '../../widgets/date&time picker.dart';
import '../../widgets/end date&time picker.dart';

class EditTrip extends ConsumerWidget {
  final String TripName;
  final String price;
  final String location;
  final String sDate;
  final String eDate;
  final String description;
  final String tripId;

  EditTrip(
      {Key? key,
      required this.TripName,
      required this.price,
      required this.location,
      required this.sDate,
      required this.eDate,
      required this.description,
      required this.tripId}) {
    _controllertripName = TextEditingController(text: TripName);
    _controllerdescription = TextEditingController(text: description);
    _controlleprice = TextEditingController(text: price);
    // _controllerimg = TextEditingController(text: _shoppingItem['img']);
    _controllerlocation = TextEditingController(text: location);
    // _controllerlatlng =TextEditingController(text: _shoppingItem['latlng']);
    _controllerstartDate = TextEditingController(text: sDate);
    _controllerendDate = TextEditingController(text: eDate);

    _reference = FirebaseFirestore.instance.collection('trips').doc(tripId);
  }

  // Map _shoppingItem;
  late DocumentReference _reference;

  late TextEditingController _controllertripName;
  late TextEditingController _controllerdescription;
  late TextEditingController _controlleprice;
  late TextEditingController _controllerlocation;
  // late TextEditingController _controllerimg;
  // late TextEditingController _controllerlatlng;
  late TextEditingController _controllerstartDate;
  late TextEditingController _controllerendDate;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              CustomTextField(
                controller: _controllertripName,
                ot: false,
                hint: 'Trip Name',
                icon: Icons.hotel,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _controllerdescription,
                ot: false,
                hint: 'Trip Description',
                icon: Icons.description,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _controlleprice,
                ot: false,
                hint: 'Trip Price',
                icon: Icons.price_check_outlined,
              ),
              SizedBox(
                height: 5,
              ),
              // CustomTextField(
              //   controller: _controllerimg,
              //   ot: false,
              //   hint: 'Trip image Location',
              //   icon: Icons.image,
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              CustomTextField(
                controller: _controllerlocation,
                ot: false,
                hint: 'Trip  Location',
                icon: Icons.location_city,
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
                eDateTimePicker(),
              ]),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print("heree");
                    if (_key.currentState!.validate()) {
                      String tripName = _controllertripName.text;
                      String description = _controllerdescription.text;
                      String price = _controlleprice.text;
                      // String img = _controllerimg.text;
                      String location = _controllerlocation.text;
                      // String latlng = _controllerlatlng.text;
                      // String startDate = _controllerstartDate.text;
                      // String endDate = _controllerendDate.text;

                      //Create the Map of data
                      Map<String, String> dataToUpdate = {
                        'description': description,
                        // 'endDate': ref.watch(edateProvider).toString(),
                        // 'img': img,
                        // 'latlng':latlng,
                        'location': location,
                        'price': price,
                        // 'startDate': ref.watch(dateProvider).toString(),
                        'tripName': tripName,
                      };

                      //Call update()
                      _reference.update(dataToUpdate);
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
