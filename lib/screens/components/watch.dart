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
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            _quickBtnVisible = !_quickBtnVisible;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _quickBtnVisible
                  ? const QuickBtn()
                  : const SizedBox(
                      height: 50,
                    ),
              const ClockDial(),
            ],
          ),
        ),
      ),
    );
  }

  bool _quickBtnVisible = true;
}
