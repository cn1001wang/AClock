import 'package:aclock/models/my_theme_provider.dart';
import 'package:aclock/screens/home_screen.dart';
import 'package:aclock/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'A Clock',
    //   theme: themeData(context),
    //   darkTheme: darkThemeData(context),
    //   themeMode:  ThemeMode.dark,
    //   home: HomeScreen(),
    // );
    return ChangeNotifierProvider(
      create: (context) => MyThemeModel(),
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'A Clock',
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
