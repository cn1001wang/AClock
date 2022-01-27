import 'dart:async';

import 'package:aclock/screens/components/flip_num.dart';
import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  const FlipClock({Key? key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlipNumText(_dateTime.hour, 59),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _dateTime.second % 2 == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffb0b0b0),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffb0b0b0),
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: 30,
                  ),
          ),
          FlipNumText(_dateTime.minute, 59),
        ],
      ),
    );
  }
}
