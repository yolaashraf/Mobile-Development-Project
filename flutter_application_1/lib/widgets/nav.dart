import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/intro_screen.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:go_router/go_router.dart';
import '/main.dart';

import './admin.dart';
import './editProfile.dart';
import './history.dart';
import './home.dart';
import './profile.dart';
import './tripDetails.dart';
import '../screens/intro_screen.dart';

class MyApp extends StatelessWidget {
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
            path: 'TripDetails',
            builder: (BuildContext context, GoRouterState state) =>
                TripDetails(),
          ),
          GoRoute(
            path: 'Home',
            builder: (BuildContext context, GoRouterState state) => Home(),
          )
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) => IntroScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      );
}
