import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class cardWidget extends StatelessWidget {
  final String imgpath; //
  final String tripId; //
  final String tripdescription;
  final String price;
  final String triplocation;
  final String tripname;
  final String sDate;
  final String eDate;

  cardWidget(
      {Key? key,
      required this.imgpath,
      required this.tripId,
      required this.price,
      required this.eDate,
      required this.sDate,
      required this.tripdescription,
      required this.triplocation,
      required this.tripname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        /** Card Widget **/
        child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.blue[50],
            child: SizedBox(
                width: 300,
                height: 350,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(imgpath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ), //SizedBox
                      Text(
                        tripname,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.go('/fav');
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                            ElevatedButton(
                              onPressed: () {
                                context.go(
                                    '/TripDetails/$tripId/$tripdescription/$price/$triplocation/$tripname/$sDate/$eDate/${imgpath.replaceAll("/", "-")}');
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: const [
                                    Icon(Icons.touch_app),
                                    Text('Visit')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])))));
  }
}
