import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'widgets/nav.dart';

void main() {
  runApp(MyApp());
}

class Navv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              // context.go('/page2');
            },
            child: Text('Welcome'))
      ]),
      appBar: AppBar(title: Text('Next Page')),

      //home: IntroScreen(),
    );
  }
}
