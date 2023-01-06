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
