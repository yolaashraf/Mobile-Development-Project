// import 'package:buy_it/constants.dart';
// import 'package:buy_it/screens/admin/OrdersScreen.dart';
import 'package:go_router/go_router.dart';

import 'addTrip.dart';
// import 'package:buy_it/screens/admin/manageProduct.dart';
import 'package:flutter/material.dart';

// import 'editTrip.dart';

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
            width: double.infinity, //width el col = width elscreen
          ),
          ElevatedButton(
            onPressed: () => context.go('/AddTrip'),
            child: Text('Add Trip'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/EditTrip'),
            child: Text('Edit Trip'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/AddAdmin'),
            child: Text('Add Admin'),
          ),
        ],
      ),
    );
  }
}
