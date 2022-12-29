
import 'package:flutter/material.dart';
class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
    DateTime dateTime=DateTime.now();

  @override
  Widget build(BuildContext context) {

                return Row(
                children: [
                  
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}',
                          style: const TextStyle(fontSize: 20 , color: Colors.black ),
                        ),
                      ),
                      
                      ElevatedButton(
                        child: const Text('Select Date & Time',
                          style: const TextStyle(fontSize: 20)),
                        onPressed: ()async{
                          DateTime? newDate =await showDatePicker(
                            context: context,
                            initialDate: dateTime, 
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null)
                            return;

                          TimeOfDay? newTime =await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: dateTime.hour,
                              minute: dateTime.minute
                            ),
                          );
                          if (newTime == null)
                            return;

                          final newDateTime = DateTime(
                            newDate.year , 
                            newDate.month , 
                            newDate.day , 
                            newTime.hour , 
                            newTime.minute ,
                          );  


                          setState(() {
                            dateTime = newDateTime;
                          });  
                        },
                      ),

                    ],
                  ),
                ],
                );
              
  }
}