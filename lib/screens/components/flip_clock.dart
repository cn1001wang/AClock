import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  const FlipClock({Key? key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("翻页时钟"));
  }
}
