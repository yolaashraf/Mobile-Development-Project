import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';



class password_TextField extends StatelessWidget {

  
  final String hint;
  final IconData icon;
  final bool ot;
  
  final TextEditingController controller;
      // obscureText: ot,


  // String ?_errorMessage(String str)
  // {
  //   switch(hint)
  //   {
  //       case 'Password' :return 'Password is Empty';
  //   }
  // }
  
  password_TextField(
      {  required this.icon,required this.hint , required this.controller, required this.ot});
  @override
  Widget build(BuildContext context) {
   
  return Padding(

    padding: const EdgeInsets.all(10.0),
    child: FlutterPwValidator(

      controller: controller,
      // enableSuggestions: false,
      // autocorrect: false,
                    minLength: 8,
                    uppercaseCharCount: 2,
                    numericCharCount: 3,
                    specialCharCount: 1,
                    normalCharCount: 3,
                    width: 400,
                    height: 150,
                    onSuccess: () {
                      print("MATCHED");
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: new Text("Password is matched")));
                    },
                    onFail: () {
                      print("NOT MATCHED");
                    },


      ),

  );
}
}















