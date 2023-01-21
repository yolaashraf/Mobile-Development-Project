import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => AdminState();
}

class AdminState extends State<Admin> {
  DateTime Sdate = DateTime(2022, 12, 24);
  DateTime Edate = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                      width: 400,
                      height: 410,
                      // color: Colors.green,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bg.png"),
                            fit: BoxFit.cover),
                      )),
                  Container(
                    width: 400,
                    height: 310,
                    color: Colors.deepPurpleAccent,
                  )
                ],
              ),
              Container(
                  width: 330,
                  height: 490,
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Online',
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                            color: Colors.lightBlue),
                      ),
                      Text(
                        'BOOKING APP',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Location',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.go('/map');
                          },
                          child: Text('Search')),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Information',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                // context.go('/page2');

                                DateTime? startDate = await showDatePicker(
                                    context: context,
                                    initialDate: Sdate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));

                                if (startDate == null) return;
                                setState(() {
                                  Sdate = startDate;
                                });
                              },
                              child: Text('Start Date ')),
                          SizedBox(
                            width: 10,
                          ),
                          Text('${Sdate.year}/${Sdate.month}/${Sdate.day}'),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                // context.go('/AddEvent');

                                DateTime? EndDate = await showDatePicker(
                                    context: context,
                                    initialDate: Edate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (EndDate == null) return;
                                setState(() {
                                  Edate = EndDate;
                                });
                              },
                              child: Text('End Date ')),
                          SizedBox(
                            width: 10,
                          ),
                          Text('${Edate.year}/${Edate.month}/${Edate.day}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(onPressed: () {}, child: Text('Add Event')),
                    ],
                  )),
            ],
          ),
        ],
      ),
      appBar: AppBar(
          title: Text(
        'Admin',
        textAlign: TextAlign.center,
      )),
    );
  }
}
