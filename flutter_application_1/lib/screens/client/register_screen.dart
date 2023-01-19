import 'package:flutter/material.dart';
import '../../widgets/register_form.dart';

// enum AuthType { login, register }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      // // const SizedBox(height: 65),
                      // // const Text(
                      // //   'Hello!',
                      // //   style: TextStyle(
                      // //       color: Colors.blueGrey,
                      // //       fontSize: 32,
                      // //       fontWeight: FontWeight.w600,
                      // //       letterSpacing: 1.2),
                      // ),
                      Container(
                          // tag: 'logoAnimation',
                          child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 400,
                            height: 400,
                          ),
                          Positioned(
                              height: 85,
                              child: Text(
                                'Visitarea',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey),
                              ))
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
