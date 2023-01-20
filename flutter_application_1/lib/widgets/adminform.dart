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
                      width: 200,
                      child: TextFormField(
                        initialValue:ref.watch(curentUserProvider).value!.name,
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
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
                      child: TextFormField(
                        initialValue: ref.watch(curentUserProvider).value!.password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
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
                      width: 200,
                      child: TextFormField(
                        initialValue:ref.watch(curentUserProvider).value!.email,
                        decoration: InputDecoration(
                          hintText: 'Email' ,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            
          
        );
      
    // TextButton(
    //     onPressed: () {
    //       // context.go('/EditProfile');
    //     },
    //     child: Text(
    //       'Edit',
    //       style: TextStyle(color: Colors.blue),
    //     ));
  }
}
