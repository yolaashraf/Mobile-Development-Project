import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './edit_trip.dart';

// ignore: must_be_immutable
class tripView extends StatefulWidget {
  tripView(this.tripId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('trips').doc(tripId);
    _futureData = _reference.get();
  }

  String tripId;
  late DocumentReference _reference;

  late Future<DocumentSnapshot> _futureData;

  @override
  State<tripView> createState() => _tripViewState();
}

class _tripViewState extends State<tripView> {
  late Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item details'),
        actions: [
          IconButton(
              onPressed: () {
                //add the id to the map
                data['id'] = widget.tripId;

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => EditTrip()));
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                //Delete the item
                widget._reference.delete();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: widget._futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Column(
              children: [
                Text('${data['description']}'),
                Text('${data['endDate']}'),
                Text('${data['img']}'),
                // Text('${data['latlng']}'),
                Text('${data['location']}'),
                Text('${data['price']}'),
                Text('${data['startDate']}'),
                Text('${data['tripName']}'),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
