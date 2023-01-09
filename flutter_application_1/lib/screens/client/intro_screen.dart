import 'package:flutter/material.dart';

import 'auth_screen.dart';
import '../../widgets/nav.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(10, 95, 10, 0)),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Trips',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      Text('Adventure Time',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400)),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        child: Text(
                          'Few places in this world are more dangerous than home. Fear not, therefore, to try the mountain passes. They will kill care, save you from deadly apathy, set you free, and call forth every faculty into vigorous, enthusiastic action.',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      )
                      //   ],
                      // ),,
                      ,
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return AuthScreen();
                            })));
                          },
                          child: Icon(Icons.navigate_next_rounded)),
                    ]),
              ),

              Container(
                height: 470,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/online booking.png",
                      ),
                      fit: BoxFit.cover),
                ),
                // child: // Foreground widget here
              )
              // SizedBox(height: 10),
            ]));
  }
}





// Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             SizedBox(),
//             Hero(
//               tag: 'logoAnimation',
//               child: Image.asset(
//                 'assets/download.png',
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SizedBox(
//                   width: 200.0,
//                   height: 50.0,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.lightBlue,
//                         backgroundColor: Colors.white, // foreground
//                       ),
//                       child: Text('Get Started'),
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: ((context) {
//                             return AuthScreen();
//                           }),
//                         ));
//                         // context.go('/Home');
//                       }),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
