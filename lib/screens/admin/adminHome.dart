// import 'package:buy_it/constants.dart';
// import 'package:buy_it/screens/admin/OrdersScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

import 'addTrip.dart';
import '../../widgets/trip_view_admin.dart';
// import 'package:buy_it/screens/admin/manageProduct.dart';
import 'package:flutter/material.dart';

// import 'editTrip.dart';

class AdminHome extends StatelessWidget {
  AdminHome({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('trips');

  late Stream<QuerySnapshot> _stream;
  // static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Home")),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("assets/bg2.jpg"), fit: BoxFit.cover)),
            child: Text(''),
          ),
          ListTile(
            onTap: () {
              context.go('/AddAdmin');
            },
            title: Text('Add Admin'),
          ),
          ListTile(
            onTap: () {
              context.go("/EditAdmin");
            },
            title: Text('Account'),
          ),
          ListTile(
            onTap: () {
              context.go("/Auth");
            },
            title: Text('Logout'),
          )
        ],
      )),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTrip()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      adminTripsView(
                        TripName: thisItem['tripName'],
                        eDate: thisItem['endDate'],
                        location: thisItem['location'],
                        price: thisItem['price'],
                        sDate: thisItem['startDate'],
                        description: thisItem['description'],
                        tripId: thisItem['id'],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     SizedBox(
      //       width: double.infinity, //width el col = width elscreen
      //     ),
      //     ElevatedButton(
      //       onPressed: () => context.go('/AddTrip'),
      //       child: Text('Add Trip'),
      //     ),
      //     // ElevatedButton(
      //     //   onPressed: () => context.go('/EditTrip'),
      //     //   child: Text('Edit Trip'),
      //     // ),
      //     ElevatedButton(
      //       onPressed: () => context.go('/AddAdmin'),
      //       child: Text('Add Admin'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () => context.go('/EditAdmin'),
      //       child: Text('Edit Admin'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () => context.go('/TripList'),
      //       child: Text('Trip List'),
      //     ),
      //   ],
      // ),
    );
  }
}
