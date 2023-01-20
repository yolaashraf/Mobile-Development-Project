import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class adminform extends ConsumerWidget {
  const adminform({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        
              
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 30,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        initialValue:ref.watch(curentUserProvider).value!.name,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
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
                      width: 250,
                      child: TextFormField(
                        initialValue: ref.watch(curentUserProvider).value!.password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          // RegExp regex =
                          // RegExp(r'^(?=.*\d)(?=.*?[4-]) $');
                              if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                              if (value.length < 5) {
                                return 'Must be more than 5 charater and at least 3 digit';
                              }
                              
                              return null;
                          },
                      ),
                      
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
                      width: 250,
                      child: TextFormField(
                        initialValue:ref.watch(curentUserProvider).value!.email,
                        decoration: InputDecoration(
                          hintText: 'Email' ,
                        ),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!value.contains("@")){
                              return ("Email should contains @");
                            }
                            return null;
                          },
                      ),
                    ),
                  ],
                )
              ],
            
          
        );
      
   
  }
}
