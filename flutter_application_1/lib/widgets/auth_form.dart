import 'package:flutter/material.dart';
import 'package:mobile_project/model/user.dart';
import 'package:mobile_project/screens/intro_screen.dart';
import 'package:mobile_project/screens/register_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
              
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      print('saving user data');
                      _user.save();
                      // _showDialog(context);
                    }
                  },
                  
                ),
                
              ),

              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // foreground
                  ),
                  child: Text('Don\'t have an account?'),
                  onPressed: () {  Navigator.push(context, 
                            MaterialPageRoute(builder: ((context) {
                              return RegisterScreen();
                            }),
                            ));
                            },
                )

               
            ],
          ),
        ));
        }
  }