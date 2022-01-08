import 'package:flutter/material.dart';

class LightDarkSwitch extends StatefulWidget {
  const LightDarkSwitch({Key? key}) : super(key: key);

  @override
  _LightDarkSwitchState createState() => _LightDarkSwitchState();
}

class _LightDarkSwitchState extends State<LightDarkSwitch> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {},
    );
  }
}
