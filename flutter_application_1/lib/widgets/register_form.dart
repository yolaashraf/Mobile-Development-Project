import 'package:flutter/material.dart';
import '../model/user.dart';
import '../screens/auth_screen.dart';
import '../screens/intro_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
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
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _user.Name = val!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _user.email = val!),
              ),
              TextFormField(
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
                onSaved: (val) => setState(() => _user.password = val!),
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
                  onPressed: () {
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
                  primary: Colors.black, // foreground
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
