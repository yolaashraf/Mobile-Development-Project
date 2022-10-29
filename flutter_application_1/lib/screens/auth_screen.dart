import 'package:flutter/material.dart';
import 'package:mobile_project/widgets/auth_form.dart';

// enum AuthType { login, register }

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  // final AuthType authType;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 65),
                      const Text(
                        'Hello!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      Hero(
                        tag: 'logoAnimation',
                        child: Image.asset(
                          'assets/download.png',
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // AuthForm(authType: authType),
            AuthForm(),


          ],
        ),
      ),
    );
  }
}