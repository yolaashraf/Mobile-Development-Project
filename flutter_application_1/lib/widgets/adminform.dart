import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import '../services/users_services.dart';
import '../model/user.dart';

class adminform extends ConsumerStatefulWidget {
  const adminform({super.key});

 @override
  ConsumerState<adminform> createState() => adminform_State();

}

class adminform_State extends ConsumerState<adminform> {

             final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); 

  
      
  final TextEditingController _nameController =TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
  
  
@override
  Widget build(BuildContext context) {


  

    return  Form(
                 key: _globalKey,
                 child: 
                 
               
     Column(
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
                        controller: _nameController,
                        // initialValue:ref.watch(curentUserProvider).value!.name,
                        decoration: InputDecoration(
                          hintText: ref.watch(curentUserProvider).value!.name,
                          
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your name';
                          //   }
                          //   return null;
                          // },
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
                        controller: _passwordController,
                        // initialValue: ref.watch(curentUserProvider).value!.password,
                        decoration: InputDecoration(
                          hintText: ref.watch(curentUserProvider).value!.password,
                        ),
                        // validator: (value) {
                        //   // RegExp regex =
                        //   // RegExp(r'^(?=.*\d)(?=.*?[4-]) $');
                        //       if (value == null || value.isEmpty) {
                        //       return 'Please enter your password';
                        //     }
                        //       if (value.length < 5) {
                        //         return 'Must be more than 5 charater and at least 3 digit';
                        //       }
                              
                        //       return null;
                        //   },
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
                        controller: _emailController,
                        // initialValue:ref.watch(curentUserProvider).value!.email,
                        decoration: InputDecoration(
                          hintText: ref.watch(curentUserProvider).value!.email ,
                        ),
                        // validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your email';
                        //     }
                        //     if(!value.contains("@")){
                        //       return ("Email should contains @");
                        //     }
                        //     return null;
                        //   },
                      ),
                    ),

                  ],
                ),
                TextButton(
            onPressed: () {
              String newame = _nameController.text;
            String newEmail = _emailController.text;
            String newPassword = _passwordController.text;
            if (newame.isEmpty) {
              newame = ref.watch(curentUserProvider).value!.name;
            }
            if (newEmail.isEmpty) {
              newEmail = ref.watch(curentUserProvider).value!.email;
            }
            if (newPassword.isEmpty) {
              newPassword = ref.watch(curentUserProvider).value!.password;
            }
            // context.go('/EditProfile');
            ref.read(curentUserProvider).value!.email = newEmail;
            ref.read(curentUserProvider).value!.name = newame;
            ref.read(curentUserProvider).value!.password = newPassword;
            User_Service().UpdateAdmin(
                userId: ref.watch(curentUserProvider).value!.userid,
                name: newame,
                email: newEmail,
                password: newPassword);






              context.go('/adminHome');
              DInfo.snackBarSuccess(context, 'Edit Success');

              
            },
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.blue),
            )),
              ],
            
          
        ));
      
   
  }
}
