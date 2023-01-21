
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
  late DateTime datetime;

final edateProvider = StateProvider<DateTime>((ref) {
   return datetime;});
   

class eDateTimePicker extends ConsumerStatefulWidget {
  
  
   eDateTimePicker({super.key});

  @override
  ConsumerState<eDateTimePicker> createState() => _eDateTimePickerState();
}

class _eDateTimePickerState extends ConsumerState<eDateTimePicker> {
    
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
                          '${dateTime.day}-${dateTime.month}-${dateTime.year} --- ${dateTime.hour}:${dateTime.minute}',
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

                          datetime=newDateTime; 
                          ref.read(edateProvider.notifier).state=datetime;



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