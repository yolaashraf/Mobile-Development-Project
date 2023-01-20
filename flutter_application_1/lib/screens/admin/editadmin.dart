import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/adminform.dart';
import 'package:go_router/go_router.dart';
import 'package:d_info/d_info.dart';



class editAdmin extends StatefulWidget {
  const editAdmin({super.key});

  @override
  State<editAdmin> createState() => _editAdminState();
}

class _editAdminState extends State<editAdmin> {
             final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); 

 
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
         Positioned(
           child: Form(
                 key: _globalKey,
                 child: adminform(),
                 
               ),
         ),
        TextButton(
            onPressed: () {
              context.go('/adminHome');
              DInfo.snackBarSuccess(context, 'Edit Success');
            },
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}