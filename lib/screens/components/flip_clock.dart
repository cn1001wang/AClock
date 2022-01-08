import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  FlipClock({Key key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("翻页时钟")),
    );
  }
}
