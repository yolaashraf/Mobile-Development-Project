import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:intl/intl.dart';

import 'widgets/nav.dart';

import 'screens/admin/adminHome.dart';

import 'screens/admin/addTrip.dart';
import 'screens/admin/editTrip.dart';

import '/screens/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class Navv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              // context.go('/page2');
            },
            child: Text('Welcome'))
      ]),
      appBar: AppBar(title: Text('Next Page')),

      //home: IntroScreen(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   bool isUserLoggedIn = false;
//   @override
//   Widget build(BuildContext context) {
//      return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: AddTrip(),
//               routes: {
               
//                 // LoginScreen.id: (context) => LoginScreen(),
//                 // SignupScreen.id: (context) => SignupScreen(),
//                 // HomePage.id: (context) => HomePage(),
//                 AdminHome.id: (context) => AdminHome(),
//                 AddTrip.id: (context) => AddTrip(),

//               },
//      );
//   }
// }
