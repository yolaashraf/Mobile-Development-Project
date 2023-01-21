import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'profile_form.dart';
import 'package:go_router/go_router.dart';
import 'package:d_info/d_info.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                height: 370,
                color: Colors.white,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  height: 270,
                  color: Colors.blue,
                ),
              ],
            ),
            Positioned(
              top: 150,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                  border: Border.all(color: Colors.white, width: 30),
                  image: DecorationImage(
                    image: AssetImage("assets/profile2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
        Profile_form(),
       
      ],
    );
  }
}
