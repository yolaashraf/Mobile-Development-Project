import 'package:flutter/material.dart';
import '../screens/client/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'switch_widget.dart';

class DraweWigdet extends StatefulWidget {
  const DraweWigdet({super.key});

  @override
  State<DraweWigdet> createState() => _DraweWigdetState();
}

class _DraweWigdetState extends State<DraweWigdet> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Column(
            children: [],
          ),
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // ListTile(
          //   title: Text('Add Events '),
          //   onTap: () {
          //     context.go('/AddEvents');
          //   },
          // ),
          ListTile(
            title: Text('My History'),
            onTap: () {
              context.go('/History');
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
          switchWidget()
        ],
      ),
    );
  }
}
