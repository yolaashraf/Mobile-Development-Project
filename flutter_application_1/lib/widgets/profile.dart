import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/users.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/circle.png"),
                        fit: BoxFit.cover),
                  ),
                  height: 150,
                  // color: Colors.purpleAccent,
                ),
                Container(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 100,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      shape: BoxShape.circle,
                      color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'User Name: ' +
                                    "${useres().users[0][0]}" +
                                    "${useres().users[0][1]}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.password,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                  'Password: ' + "${useres().users[0][3]}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                  'Phone Number: ' + "${useres().users[0][6]}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text('Email: ' + "${useres().users[0][2]}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  context.go('/EditProfile');
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        appBar: AppBar(
          title: Text('Profile'),
        ));
  }
}
