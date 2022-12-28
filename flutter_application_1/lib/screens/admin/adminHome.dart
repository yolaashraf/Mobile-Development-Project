// import 'package:buy_it/constants.dart';
// import 'package:buy_it/screens/admin/OrdersScreen.dart';
import 'addTrip.dart';
// import 'package:buy_it/screens/admin/manageProduct.dart';
import 'package:flutter/material.dart';

import 'manageProducts.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,   //width el col = width elscreen
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddTrip.id);
            },
            child: Text('Add Trip'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            child: Text('Edit Product'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, OrdersScreen.id);
          //   },
          //   child: Text('View orders'),
          // )
        ],
      ),
    );
  }
}