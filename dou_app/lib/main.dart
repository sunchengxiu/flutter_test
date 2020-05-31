import 'package:douapp/widgets/star.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SCXStar(grade: 4.5),
    );
  }
}

