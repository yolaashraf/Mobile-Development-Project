import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'screens/admin/adminHome.dart';
import 'widgets/nav.dart';

import 'screens/admin/addTrip.dart';
import '/screens/admin/manageProducts.dart';

import 'screens/client/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}


// import '/screens/admin/addProduct.dart';
// import '/screens/admin/manageProducts.dart';

// import '../screens/admin/intro_screen.dart';

// void main() {
// runApp(MyApp());
// }

// class Navv extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         ElevatedButton(
//             onPressed: () {
//               // context.go('/page2');
//             },
//             child: Text('Welcome'))
//       ]),
//       appBar: AppBar(title: Text('Next Page')),

//       //home: IntroScreen(),
//     );
//   }
// }

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

// class MyApp extends StatelessWidget {
//   bool isUserLoggedIn = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: IntroScreen(),
//       routes: {
//         // LoginScreen.id: (context) => LoginScreen(),
//         // SignupScreen.id: (context) => SignupScreen(),
//         // HomePage.id: (context) => HomePage(),
//         AdminHome.id: (context) => AdminHome(),
//         AddTrip.id: (context) => AddTrip(),
//         ManageProducts.id: (context) => ManageProducts(),
//       },
//     );
//   }
// }
