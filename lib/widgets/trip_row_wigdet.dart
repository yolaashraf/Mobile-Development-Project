import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class customeRow extends StatelessWidget {
  final String imgpath;
  final String triplocation;
  final String sDate;
  final String eDate;
  final String tripid;
  final String tripname;
  final String price;
  final String tripdescription;

  customeRow({
    Key? key,
    required this.imgpath,
    required this.triplocation,
    required this.sDate,
    required this.eDate,
    required this.tripid,
    required this.price,
    required this.tripdescription,
    required this.tripname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 200,
              height: 150,
              child: Image.asset(
                '$imgpath',
                // scale: 1.4,
              ),
            ),
            SizedBox(
              width: 13,
            ),
            // SizedBox(height: 20, width: 30),
            Column(
              children: [
                Container(
                    width: 150,
                    child: Text(
                      tripname,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                Container(width: 150, child: Text('$triplocation')),
                Container(width: 150, child: Text('$sDate')),
                Container(width: 150, child: Text('$eDate')),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      String path =
                          "/TripDetails/$tripid/$tripdescription/$price/$triplocation/$tripname/$sDate/$eDate/${imgpath.replaceAll("/", "-")}";
                      context.go("$path");
                      // /${tripdescription}/${price}/${sDate}/${location}/${tripname}/${eDate}/${imgpath}');
                    },
                    child: Text('Visit',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 227, 225, 225),
                        side: BorderSide(
                            color: Color.fromARGB(255, 227, 225, 225))),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
