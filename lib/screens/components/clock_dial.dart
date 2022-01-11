import 'dart:async';

import 'package:aclock/size_config.dart';
import 'package:flutter/material.dart';

import 'clock_painter.dart';

class ClockDial extends StatefulWidget {
  const ClockDial({Key? key}) : super(key: key);

  @override
  _ClockDialState createState() => _ClockDialState();
}

class _ClockDialState extends State<ClockDial> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: SizeConfig.screenHeight - 40 - 80,
        // padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: const Color(0xFF364564).withOpacity(0.14),
                  blurRadius: 64,
                ),
              ],
            ),
            child: CustomPaint(
              painter: ClockPainter(context, _dateTime),
            ),
          ),
        ),
      ),
    );
  }
}
