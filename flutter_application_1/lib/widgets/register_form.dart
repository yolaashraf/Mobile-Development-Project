import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/users_services.dart';
import '../model/user.dart';
import '../screens/client/auth_screen.dart';
import '../screens/client/intro_screen.dart';
import '../services/users_services.dart';
import 'package:d_info/d_info.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final _user = User();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                // onSaved: (val) => setState(() => _user.Name = val!),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                // onSaved: (val) => setState(() => _user.email = val!),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password.';
                  }
                  return null;
                },
                // onSaved: (val) => setState(() => _user.password = val!),
              ),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Mobile'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty ) {
              //       return 'Please enter your Mobile';
              //     }
              //     return null;
              //   },
              //   onSaved: (val) => setState(() => _user.Mobile = val as int),
              // ),

              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  onPressed: () {
                    final String newame = nameController.text;
                    final String newEmail = emailController.text;
                    final String newPassword = passwordController.text;

                    if (newame.isEmpty ||
                        newEmail.isEmpty ||
                        newPassword.isEmpty) {
                      DInfo.snackBarError(
                          context, 'Please enter the required fields!');
                    } else {
                      User_Service().creatUser(
                          name: newame,
                          email: newEmail,
                          password: newPassword,
                          type: 'client');
                    }

                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      // form.save();
                      // print('saving user data');
                      // _user.save();
                      // _showDialog(context);
                      // Navigator.pop(context);

                      Navigator.push(context, MaterialPageRoute(
                        builder: ((context) {
                          return AuthScreen();
                        }),
                      ));
                    }
                  },
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // foreground
                ),
                child: Text('Already have an account?'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: ((context) {
                      return AuthScreen();
                    }),
                  ));
                },
              )
            ],
          ),
        ));
  }
}
