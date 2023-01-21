import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/trip_row_wigdet.dart';
import '../../services/trip_services.dart';
import '../../model/trip.dart';
import '../../widgets/drawer_widget.dart';
import '../client/favorites_screen.dart';
import '../client/profile_screen.dart';
import '../../widgets/card_widget.dart';
import '../../widgets/home_widget.dart';
import '../../widgets/profile_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;
  final screens = [Fav(), homeWidget(), ProfileWidget()];
  final appbars = ['Favorite', 'Home', 'Profile'];
  @override
  Widget build(BuildContext context) {
    print(currentIndex);

    // final trips = ref.watch(allTrips);

    // trips.when(
    //   data: (AsyncTrips) => AsyncTrips.forEach((trips) {}),
    //   error: (error, stackTrace) {
    //     Center(
    //       child: Text(error.toString()),
    //     );
    //   },
    //   loading: () => const Center(child: CircularProgressIndicator()),
    // );

    // trips.whenData((trips) => trips);

    // trips.value!.length

    // final currentuser = ref.watch(curentUserProvider);
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarlTheme'
        : 'LightTheme';

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'favourites',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account')
            ]),
        drawer: DraweWigdet(),
        appBar: AppBar(
          title: Text(
            appbars[currentIndex],
            textAlign: TextAlign.center,
          ),
        ));
  }
}
