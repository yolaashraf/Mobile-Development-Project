import 'package:flutter/material.dart';

class HistoryRow extends StatelessWidget {
  final String TripName;
  final String price;
  final String location;
  final String sDate;
  final String eDate;
  final String state;

  HistoryRow(
      {Key? key,
      required this.TripName,
      required this.price,
      required this.location,
      required this.sDate,
      required this.eDate,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 223, 222, 222),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$TripName",
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
                        Text(" Amount: " + price)
                      ],
                    ),
                    Row(children: [
                      SizedBox(width: 50),
                      Text(" Location: " + location)
                    ]),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Text(" Start Date: " + sDate)
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Text(" End Date: " + eDate)
                      ],
                    )
                  ],
                )
              ],
            )),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
