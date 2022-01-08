import 'dart:io';
import 'package:flutter/material.dart';

class QuickBtn extends StatefulWidget {
  const QuickBtn({Key? key}) : super(key: key);

  @override
  _QuickBtnState createState() => _QuickBtnState();
}

class _QuickBtnState extends State<QuickBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        exit(0);
      },
      child: Container(
        // height: 20,
        padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.close,
          size: 30,
        ),
      ),
    );
  }
}
