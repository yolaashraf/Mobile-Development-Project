import 'package:flutter/material.dart';
import '/widgets/date&time picker.dart';
class AddTrip extends StatefulWidget {
    static String id='AddTrip';

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
        child: ListView(
          children: <Widget>[
            TextField("Trip_Name" , "Name" ,"Can't be empty"),

            SizedBox(
              height: 20,
            ),
            TextField("Trip_ID" , "ID" ,"Can't be empty"),
            SizedBox(
              height: 20,
            ),
            TextField("Trip_Discription" , "Discription" ,"Can't be empty"),
            SizedBox(
              height: 20,
            ),
            TextField("Trip_Price" , "Price" ,"Can't be empty"),
            SizedBox(
              height: 20,
            ),
            Row(
                children: [
                  Text(
                        'Start Date : ',
                        style: TextStyle( fontSize: 20),
                      ),
                
                   
                  DateTimePicker(),
                ]  
            ),          
             SizedBox(
              height: 20,
            ),
            Row(
                children: [
                  Text(
                        'End Date : ',
                        style: TextStyle( fontSize: 20),
                      ),
                
                   
                  DateTimePicker(),
                ]  
            ), 
        ]),
      ),
    );
  }

  Widget TextField(label,hint,helper){
    return TextFormField(
      // maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            )
        ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2,
            )
        ),  
      prefixIcon: Icon(
        Icons.flight,
        color: Colors.cyan,
         ),
         labelText: label,
         hintText: hint,
         helperText: helper,
      ) ,
      
    );
  }
}