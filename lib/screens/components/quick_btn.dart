import 'package:flutter/material.dart';

class QuickBtn extends StatefulWidget {
  const QuickBtn({Key? key}) : super(key: key);

  @override
  _QuickBtnState createState() => _QuickBtnState();
}

class _QuickBtnState extends State<QuickBtn> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          // exit(0);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          primary: Theme.of(context).colorScheme.surface, // <-- Button color
          onPrimary: Theme.of(context).iconTheme.color, // <-- Splash color
        ),
        child: const Icon(
          Icons.close,
          size: 30,
        ),
      ),
    );
  }
}
