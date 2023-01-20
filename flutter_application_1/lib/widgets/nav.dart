import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/adminProfile.dart';
import 'package:flutter_application_1/screens/admin/editadmin.dart';
import 'package:flutter_application_1/screens/client/intro_screen.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:go_router/go_router.dart';
import '/main.dart';
import '../screens/admin/adminHome.dart';

import './admin.dart';
import 'edit_profile.dart';
import '../screens/client/history_screen.dart';
import '../screens/admin/home_screen.dart';
import '../screens/client/profile_screen.dart';
import '../screens/client/trip_details_screen.dart';
import '../screens/client/intro_screen.dart';
import '../screens/client/auth_screen.dart';
import '../screens/admin/addTrip.dart';
import '../screens/admin/editadmin.dart';
import '../screens/admin/edit_trip.dart';
import '../screens/admin/add admin.dart';
import '../widgets/theme.dart';

import 'package:riverpod/riverpod.dart';

final themeProvider = StateProvider<bool>(((ref) {
  return false;
}));

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  static const String title = 'GoRouter Routes';

  final GoRouter _router = GoRouter(
    // errorBuilder: (context, state) => ErrorScreen(error:state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'Profile',
            builder: (BuildContext context, GoRouterState state) => Profile(),
          ),
          GoRoute(
            path: 'History',
            builder: (BuildContext context, GoRouterState state) => History(),
          ),
          GoRoute(
            path: 'AddEvents',
            builder: (BuildContext context, GoRouterState state) => Admin(),
          ),
          GoRoute(
            path: 'EditProfile',
            builder: (BuildContext context, GoRouterState state) =>
                EditProfile(),
          ),
          GoRoute(
            path:
                "TripDetails/:tripid/:tripdescription/:price/:triplocation/:tripname/:tripsdate/:edate/:img",
            builder: (BuildContext context, GoRouterState state) => TripDetails(
              tripid: state.params['tripid']!,
              tripdescription: state.params['tripdescription']!,
              pricee: state.params['price']!,
              tripsdate: state.params['tripsdate']!,
              triplocation: state.params['triplocation']!,
              tripname: state.params['tripname']!,
              edate: state.params['edate']!,
              img: state.params['img']!,
              // tripimg: state.params['tripimg']!,
            ),
          ),
          GoRoute(
            path: 'Home',
            builder: (BuildContext context, GoRouterState state) => Home(),
          ),
          GoRoute(
            path: 'Auth',
            builder: (BuildContext context, GoRouterState state) =>
                AuthScreen(),
          ),
          GoRoute(
            path: 'AddTrip',
            builder: (BuildContext context, GoRouterState state) => AddTrip(),
          ),
          GoRoute(
            path: 'EditTrip',
            builder: (BuildContext context, GoRouterState state) => EditTrip(),
          ),
          GoRoute(
            path: 'EditAdmin',
            builder: (BuildContext context, GoRouterState state) => adminProfile(),
          ),
          GoRoute(
            path: 'AdminHome',
            builder: (BuildContext context, GoRouterState state) => AdminHome(),
          ),
          GoRoute(
            path: 'AddAdmin',
            builder: (BuildContext context, GoRouterState state) => AddAdmin(),
          )
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) => IntroScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
    );
  }
}
