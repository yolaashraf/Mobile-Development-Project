// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class switchWidget extends ConsumerStatefulWidget {
  late bool theme;

  @override
  ConsumerState<switchWidget> createState() => _switchWidgetState();
}

class _switchWidgetState extends ConsumerState<switchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return Container();
          },
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              if (!isSwitched) {
                isSwitched = true;
                ref.read(themeProvider.notifier).state = true;
              } else if (isSwitched) {
                ref.read(themeProvider.notifier).state = false;

                widget.theme = false;

                isSwitched = false;
              }
            });
            print(isSwitched);
          },
          activeTrackColor: Colors.grey,
          activeColor: Colors.black,
        )
      ],
    );
  }
}
