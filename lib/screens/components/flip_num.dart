import 'dart:math';

import 'package:aclock/size_config.dart';
import 'package:flutter/material.dart';

class FlipNumText extends StatefulWidget {
  final int num;
  final int maxNum;

  const FlipNumText(this.num, this.maxNum, {Key? key}) : super(key: key);

  @override
  _FlipNumTextState createState() => _FlipNumTextState();
}

class _FlipNumTextState extends State<FlipNumText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  bool _isReversePhase = false;

  final double _zeroAngle = 0.0001;

  int _stateNum = 0;

  @override
  void initState() {
    super.initState();
    _stateNum = widget.num;

    ///动画控制器，正向执行一次后再反向执行一次每次时间为450ms。
    _controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          ///正向动画执行结束后，反向动画执行标志位设置true 进行反向动画执行
          _controller.reverse();
          _isReversePhase = true;
//          print("AnimationStatus.completed");
        }
        if (status == AnimationStatus.dismissed) {
          ///反向动画执行结束后，反向动画执行标志位false 将当前数值加一更改为动画后的值
          _isReversePhase = false;
          _calNum();
//          print("AnimationStatus.dismissed");
        }
      })
      ..addListener(() {
        setState(() {});
      });

    ///四分之一的圆弧长度
    _animation = Tween(begin: _zeroAngle, end: pi / 2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    Color _color = const Color(0xffb0b0b0);
    Color bgColor = const Color(0xff191919);
    const double entryV = 0.0005;
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: <Widget>[
              ClipRectText(
                _nextNum(),
                Alignment.topCenter,
                color: _color,
                bgColor: bgColor,
              ),

              ///动画正向执行翻转的组件
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, entryV)
                  ..rotateX(_isReversePhase ? pi / 2 : _animation.value),
                alignment: Alignment.bottomCenter,
                child: ClipRectText(
                  _stateNum,
                  Alignment.topCenter,
                  color: _color,
                  bgColor: bgColor,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
          ),
          Stack(
            children: <Widget>[
              ClipRectText(_stateNum, Alignment.bottomCenter,
                  color: _color, bgColor: bgColor),

              ///动画反向执行翻转的组件
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, entryV)
                  ..rotateX(_isReversePhase ? -_animation.value : pi / 2),
                alignment: Alignment.topCenter,
                child: ClipRectText(
                  _nextNum(),
                  Alignment.bottomCenter,
                  color: _color,
                  bgColor: bgColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(FlipNumText oldWidget) {
    if (widget.num != oldWidget.num) {
      _controller.forward();
      _stateNum = oldWidget.num;
    }
    super.didUpdateWidget(oldWidget);
  }

  _nextNum() {
    if (_stateNum == widget.maxNum) {
      return 0;
    } else {
      return _stateNum + 1;
    }
  }

  _calNum() {
    if (_stateNum == widget.maxNum) {
      _stateNum = 0;
    } else {
      _stateNum += 1;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class ClipRectText extends StatelessWidget {
  final int _value;
  final Alignment _alignment;
  final Color color;
  final Color bgColor;

  const ClipRectText(
    this._value,
    this._alignment, {
    Key? key,
    required this.bgColor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontFamily: "Din",
      fontSize: getProportionateScreenWidth(170.0),
      color: color,
      fontWeight: FontWeight.w700,
    );
    final prototypeDigit = TextPainter(
      text: TextSpan(text: "88", style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    final double horizontalPadding = getProportionateScreenWidth(20.0);
    final double verticalPadding = getProportionateScreenWidth(40.0);
    final double w = prototypeDigit.size.width + 2 * horizontalPadding;
    String _val = _value < 10 ? "0" + _value.toString() : _value.toString();
    return ClipRect(
      child: Align(
        alignment: _alignment,
        heightFactor: 0.5,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          alignment: Alignment.center,
          width: w,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(24.0))),
          ),
          child: Text(
            _val,
            style: style,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
