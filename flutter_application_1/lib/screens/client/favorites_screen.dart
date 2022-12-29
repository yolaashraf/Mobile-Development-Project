import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/card_widget.dart';

class Fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Column(children: [
            Text(
              'My Favorites',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        cardWidget(imgpath: 'assets/img1.jpeg', tripName: 'Yosemite'),
      ],
    );
  }
}
