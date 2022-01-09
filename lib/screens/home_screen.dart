import 'package:aclock/screens/components/flip_clock.dart';
import 'package:aclock/screens/components/watch.dart';
import 'package:aclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  ///控制器
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    // setHorizontalScreen();
  }

  final _pages = [
    const FlipClock(),
    const Watch(),
  ];

  void setHorizontalScreen() {
    // if (Platform.isAndroid) {
    //   SystemUiOverlayStyle systemUiOverlayStyle =
    //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }

    // 隐藏底部按钮栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    // 隐藏状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    // 隐藏状态栏和底部按钮栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    //将屏幕横过来
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    // we have to call this on our starting page
    SizeConfig().init(context);
    return Material(
      child: PageView.builder(
        ///设置滑动模式
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return buildItemWidget(index);
        },
        itemCount: _pages.length,
      ),
    );
  }

  Widget buildItemWidget(int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _pages[index],
    );
  }
}
