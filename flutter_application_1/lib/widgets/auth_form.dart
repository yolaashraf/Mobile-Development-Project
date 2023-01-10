import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/users_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user.dart';
import '../screens/client/intro_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/client/register_screen.dart';
import '../services/users_services.dart';
import '../screens/admin/home_screen.dart';
import 'package:d_info/d_info.dart';
import '../screens/admin/adminHome.dart';

final UsersFutureProvider =
    StreamProvider<List<User>>((ref) => User_Service().readUsers());

final curentUserProvider = FutureProvider<User>(((ref) {
  return User(email: "", name: "", password: "", userid: "", type: "");
}));
// import '../model/user.dart';

class AuthForm extends ConsumerWidget {
  AuthForm({super.key});

  final _formKey = GlobalKey<FormState>();

  // final _user = User();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(UsersFutureProvider);
    final currentUser = ref.watch(curentUserProvider);
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
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
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
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      final newEmail = emailController.text;
                      final newPasswprd = passwordController.text;
                      bool check = false;

                      allUsers.when(
                          data: (users) => users.forEach(
                                (user) {
                                  // print("HELLLOOOOO  " + newEmail);
                                  if (newEmail == user.email &&
                                      newPasswprd == user.password) {
                                    check = true;
                                    currentUser.whenData((current) {
                                      current.email = user.email;
                                      current.name = user.name;
                                      current.password = user.password;
                                      current.userid = user.userid;
                                      current.type = user.type;
                                    });
                                  }
                                },
                              ),
                          error: ((error, stackTrace) {
                            Center(child: Text(error.toString()));
                          }),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()));
                      if (newPasswprd.isEmpty || newEmail.isEmpty) {
                        DInfo.snackBarError(
                            context, 'Please enter your email and password!');
                      } else {
                        if (check == true) {
                          if (currentUser.value!.type == "client") {
                            Navigator.push(context, MaterialPageRoute(
                              builder: ((context) {
                                return Home();
                              }),
                            ));
                          } else if (currentUser.value!.type == "admin") {
                            Navigator.push(context, MaterialPageRoute(
                              builder: ((context) {
                                return AdminHome();
                              }),
                            ));
                          }

                          // print("HEREEEE");

                          // context.go('/Home');
                        } else {
                          DInfo.snackBarError(
                              context, 'Incorrect email or password!');
                        }
                      }
                      // _showDialog(context);
                    }),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black, // foreground
                ),
                child: Text('Don\'t have an account?'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: ((context) {
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
