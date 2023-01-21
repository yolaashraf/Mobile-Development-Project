import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/addTrip.dart';
import 'package:flutter_application_1/widgets/trip_view_admin.dart';
import './tripView.dart';

class tripList extends StatelessWidget {
  tripList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('trips');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'description': e['description'],
                      'endDate': e['endDate'],
                      'img': e['img'],
                      // 'latlng':e['latlng'],
                      'location': e['location'],
                      'price': e['price'],
                      'startDate': e['startDate'],
                      'tripName': e['tripName'],
                    })
                .toList();

            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return adminTripsView(
                    description: thisItem['description'],
                    TripName: thisItem['tripName'],
                    eDate: thisItem['endDate'],
                    location: thisItem['location'],
                    price: thisItem['price'],
                    sDate: thisItem['startDate'],
                  );

                  // ListTile(
                  //   title: Text('${thisItem['tripName']}'),
                  //   subtitle: Text('${thisItem['startDate']}'),
                  //   Text('${thisItem['price']}'),
                  //   subtitle: Text('${thisItem['location']}'),
                  //   subtitle: Text('${thisItem['latlng']}'),
                  //   subtitle: Text('${thisItem['img']}'),
                  //   subtitle: Text('${thisItem['endDate']}'),
                  //   subtitle: Text('${thisItem['description']}'),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => tripView(thisItem['id'])));
                  // },
                  // );
                });
          }

          //Show loader
          return Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTrip()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
