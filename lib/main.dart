import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/screens/home/home_screen.dart';
import 'package:jds_design/constants/colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: JDSColors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}