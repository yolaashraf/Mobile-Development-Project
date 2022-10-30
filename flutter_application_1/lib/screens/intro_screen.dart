import 'package:flutter/material.dart';

import 'auth_screen.dart';

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
                '../assets/download.png', height: 300,
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
                            primary: Colors.white, // background
                            onPrimary: Colors.lightBlue, // foreground
                          ),
                          child: Text('Get Started'),
                          onPressed:(){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: ((context) {
                              return AuthScreen();
                            }),
                            ));
                          }
                        ),
                ),
              ),
              ),
           
            
          ],
        ),
      ),
    );
  }
}