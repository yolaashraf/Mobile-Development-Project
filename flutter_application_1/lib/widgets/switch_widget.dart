import 'package:flutter/material.dart';

class switchWidget extends StatefulWidget {
  @override
  State<switchWidget> createState() => _switchWidgetState();
}

class _switchWidgetState extends State<switchWidget> {
  bool isSwitched = false;
  String theme = 'Light theme';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(theme),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              if (!isSwitched) {
                isSwitched = true;
                theme = 'Dark Theme';
              } else if (isSwitched) {
                theme = 'Light Theme';
                isSwitched = false;
              }
            });
          },
          activeTrackColor: Colors.grey,
          activeColor: Colors.black,
        )
      ],
    );
  }
}
