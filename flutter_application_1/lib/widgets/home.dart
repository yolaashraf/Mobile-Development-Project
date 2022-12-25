import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/auth_screen.dart';
import '../screens/intro_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List<ListView>? HistoryRows;

  ListView? HistoryData(int size) {
    for (int x = 0; x < size; x++) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.lightBlue,
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'User',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 210,
                  ),
                  Container(
                    child: Icon(
                      Icons.person_rounded,
                      size: 80,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),

                    // width: 60,
                    // height: 60,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.black,
                      size: 50,
                    ),
                    color: Colors.white,
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    child: Icon(
                      Icons.airplanemode_active_rounded,
                      color: Colors.black,
                      size: 50,
                    ),
                    color: Colors.white,
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    child: Icon(
                      Icons.event_available,
                      color: Colors.black,
                      size: 50,
                    ),
                    color: Colors.white,
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Trips',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Events',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
            ]),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Up Comming Events',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Image.asset(
                    'assets/img1.jpeg',
                    scale: 1.4,
                  ),
                  SizedBox(height: 30, width: 30),
                  Column(
                    children: [
                      Text('Location'),
                      Text('Start Date'),
                      Text('End Date'),
                      ElevatedButton(
                        onPressed: () {
                          context.go('/TripDetails');
                        },
                        child: Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                )
              ]),
            ],
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Column(
            children: [],
          ),
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text('Account'),
            onTap: () {
              context.go('/Profile');
            },
          ),
          ListTile(
            title: Text('Add Events '),
            onTap: () {
              context.go('/AddEvents');
            },
          ),
          ListTile(
            title: Text('My History'),
            onTap: () {
              context.go('/History');
            },
          ),
          ListTile(
            title: Text('Favourite'),
            onTap: () {
              // context.go('/History');
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return AuthScreen();
              })));
            },
          ),
        ],
      )),
      appBar: AppBar(
          title: Text(
        'Home',
        textAlign: TextAlign.center,
      )),
    );
  }
}
