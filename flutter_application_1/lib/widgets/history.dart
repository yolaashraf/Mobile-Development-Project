import 'package:flutter/material.dart';
import '../data/historydata.dart';

class History extends StatelessWidget {
  List Tripinfo = data().historyData;
  ListView history = ListView(
    children: [],
  );

  History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 223, 222, 222),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${data().historyData[0][0]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        'Confirmed',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Column(
                    children: [SizedBox(height: 30)],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Text(" Amount: " + '${data().historyData[0][1]}')
                        ],
                      ),
                      Row(children: [
                        SizedBox(width: 50),
                        Text(" Location: " + '${data().historyData[0][2]}')
                      ]),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Text(" Start Date: " + '${data().historyData[0][3]}')
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Text(" End Date: " + '${data().historyData[0][4]}')
                        ],
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
      appBar: AppBar(title: Text('History')),
    );
  }
}
