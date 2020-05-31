import 'package:douapp/widgets/star.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';
import 'package:douapp/widgets/dash_line.dart';
import 'package:douapp/pages/main/main.dart';
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
//        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightColor: Colors.transparent,// 取消点击有阴影的那种效果
        splashColor: Colors.transparent// 取消点击有阴影的那种效果
      ),
        home: SCXMainPage(),
// 测试虚线
//      home: buildDashLine(),
// 测试星星
//      home: SCXStar(grade: 4.5),
    );
  }

  Center buildDashLine() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 200,
            child: SCXDashLine(axis: Axis.horizontal,dashWidth: 5,dashHeight: 1,),
          ),
          Container(
            height: 200,
            child: SCXDashLine(axis: Axis.vertical,dashWidth: 1,dashHeight: 5,),
          ),
        ],
      ),

    );
  }
}

