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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            width: 350,
            padding: EdgeInsets.all(10),
            // color: Color.fromARGB(255, 223, 222, 222),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  children: [SizedBox(height: 10)],
                ),
                Column(
                  children: [
                    Row(
                      children: [SizedBox(width: 0), Text(" Amount: " + price)],
                    ),
                    Row(children: [
                      // SizedBox(width: 0),
                      Text(" Location: " + location)
                    ]),
                    Row(
                      children: [
                        // SizedBox(width: 0),
                        Text(" Start Date: " + sDate)
                      ],
                    ),
                    Row(
                      children: [
                        // SizedBox(width: 0),
                        Text(" End Date: " + eDate)
                      ],
                    )
                  ],
                )
              ],
            )),
        // SizedBox(
        //   height: 30,
        // )
      ],
    );
  }
}
