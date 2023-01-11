import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hint;
  // final String lable;, required this.lable

  final IconData icon;
  
  // var controller;
  
  final TextEditingController controller;
// final FormFieldSetter<String>? onClick;, required this.onClick


  String ?_errorMessage(String str)
  {
    switch(hint)
    {
      case 'Trip Name' :return 'Trip name is empty';
      case 'Trip Description' :return 'Trip Description is empty';
      case 'Trip Price' :return 'Trip Price is empty';
      case 'Trip ID' :return 'Trip name is ID';
    }
  }
  
  CustomTextField(
      { required this.icon,required this.hint , required this.controller});
  @override
  Widget build(BuildContext context) {
   
  return Padding(

    padding: const EdgeInsets.all(10.0),
    child: TextFormField(

      controller: controller,
      // maxLines: 5,
      validator:(value) {
        if(value!.isEmpty){
          return _errorMessage(hint);
        }
        
      } ,
      // onSaved: onClick,
      decoration: InputDecoration(
          // labelText: lable ,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 244, 240, 240),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 52, 169, 228),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromARGB(255, 19, 37, 233))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromARGB(255, 245, 225, 153))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromARGB(255, 198, 118, 43))),
        ),
      ),

  );
}

}