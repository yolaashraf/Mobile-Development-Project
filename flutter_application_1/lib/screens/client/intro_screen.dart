import 'package:flutter/material.dart';

import 'auth_screen.dart';
import '../../widgets/nav.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Hero(
              tag: 'logoAnimation',
              child: Image.asset(
                'assets/download.png',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.lightBlue,
                        backgroundColor: Colors.white, // foreground
                      ),
                      child: Text('Get Started'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: ((context) {
                            return AuthScreen();
                          }),
                        ));
                        // context.go('/Home');
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}