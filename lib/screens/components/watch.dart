import 'file:///D:/FlutterCodes/FlutterTest/aclock/lib/screens/components/quick_btn.dart';
import 'package:flutter/material.dart';

import 'clock_dial.dart';

class Watch extends StatefulWidget {
  Watch({Key key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          QuickBtn(),
          ClockDial(),
        ],
      ),
    );
  }
}

