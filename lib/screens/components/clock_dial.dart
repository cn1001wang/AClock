import 'dart:async';
import 'dart:math';

import 'package:aclock/size_config.dart';
import 'package:flutter/material.dart';

import 'clock_painter.dart';

class ClockDial extends StatefulWidget {
  @override
  _ClockDialState createState() => _ClockDialState();
}

class _ClockDialState extends State<ClockDial> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: SizeConfig.screenHeight - 40 - 80,
          padding: EdgeInsets.only(top: 20, bottom: 40),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0xFF364564).withOpacity(0.14),
                    blurRadius: 64,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
