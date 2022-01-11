import 'package:aclock/screens/components/flip_num.dart';
import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  const FlipClock({Key? key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlipNumText(num, 59),
            TextButton(
              child: const Text("ADD"),
              onPressed: () {
                setState(() {
                  if (num < 60) {
                    num += 1;
                  } else {
                    num = 0;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
