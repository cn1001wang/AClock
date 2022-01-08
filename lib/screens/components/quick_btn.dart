import 'dart:io';
import 'package:flutter/material.dart';

class QuickBtn extends StatefulWidget {
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
        padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.close,
          size: 30,
        ),
      ),
    );
  }
}
