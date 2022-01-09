import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    drawLine(canvas, size);
    drawText(canvas, size);
  }

  drawLine(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minX = centerX +
        size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180 - pi / 2);
    double minY = centerY +
        size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180 - pi / 2);

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 -
                pi / 2);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 -
                pi / 2);

    // hour Line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    // cos接受的是弧度，弧度=角度*π/180；360度角=2*pi
    double secondX = centerX +
        size.width * 0.4 * cos((dateTime.second * 6) * pi / 180 - pi / 2);
    double secondY = centerY +
        size.width * 0.4 * sin((dateTime.second * 6) * pi / 180 - pi / 2);

    // Second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);

    // center Dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color!;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  drawText(Canvas canvas, Size size) {
    const double padding = 15.0;
    // double centerX = size.width / 2;
    // double centerY = size.height / 2;
    // Offset center = Offset(centerX, centerY);
    TextStyle? textStyle =
        Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20);
    var textSpan = TextSpan(
      text: '12',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset12 = Offset((size.width - textPainter.width) / 2, 0 + padding);
    textPainter.paint(canvas, offset12);

    var textSpan3 = TextSpan(
      text: '3',
      style: textStyle,
    );
    final textPainter3 = TextPainter(
      text: textSpan3,
      textDirection: TextDirection.ltr,
    );
    textPainter3.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset3 = Offset(size.width - textPainter3.width - padding,
        (size.height - textPainter3.height) / 2);
    textPainter3.paint(canvas, offset3);

    var textSpan6 = TextSpan(
      text: '6',
      style: textStyle,
    );
    final textPainter6 = TextPainter(
      text: textSpan6,
      textDirection: TextDirection.ltr,
    );
    textPainter6.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset6 = Offset((size.width - textPainter6.width) / 2,
        size.height - textPainter6.height - padding);
    textPainter6.paint(canvas, offset6);

    var textSpan9 = TextSpan(
      text: '9',
      style: textStyle,
    );
    final textPainter9 = TextPainter(
      text: textSpan9,
      textDirection: TextDirection.ltr,
    );
    textPainter9.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset9 =
        Offset(0 + padding, (size.height - textPainter3.height) / 2);
    textPainter9.paint(canvas, offset9);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
