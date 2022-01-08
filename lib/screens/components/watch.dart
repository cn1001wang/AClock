import 'package:flutter/material.dart';

import 'clock_dial.dart';
import 'quick_btn.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          QuickBtn(),
          ClockDial(),
        ],
      ),
    );
  }
}
