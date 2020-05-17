import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget 练习"),
      ),
      body: MyHomeBody(),
      // 悬浮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("点击 floating button");
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

// 富文本
class _MyHomeState extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return MyRichButtons;
  }

  Column get MyRichButtons {
    return Column(
    children: <Widget>[
      RaisedButton(
        onPressed: () {
          print("点击 rich button");
        },
        textColor: Colors.blue,
        color: Colors.black,
        child: Text("rich button"),
      ),
      FlatButton(
          onPressed: () {
            print("点击 flat button");
          },
          child: Text("flat button")),
      OutlineButton(
        onPressed: () {
          print("点击 outlinee button");
        },
        child: Text("outlinee button"),
      ),
      // 自定义 button
      FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
          color: Colors.purple,
          onPressed: () {},
          child: Row(
            // 默认占据一整行，改成最小
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite),
              Text("买路虎"),
            ],
          )
      )
    ],
  );
  }
}

// 富文本
class _MyHomeState2 extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return MyTextRich();
  }

  Center MyTextRich() {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "hello", style: TextStyle(color: Colors.red)),
        WidgetSpan(child: Icon(Icons.face)),
        TextSpan(text: "world", style: TextStyle(color: Colors.green)),
        WidgetSpan(child: Icon(Icons.favorite)),
        TextSpan(text: "sunchenegxiu", style: TextStyle(color: Colors.blue)),
      ])),
    );
  }
}

// 文本
class _MyHomeState1 extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "今夕何夕兮，搴舟中流。\n今日何日兮，得与王子同舟。\n蒙羞被好兮，不訾诟耻。\n心几烦而不绝兮，得知王子心几烦而不绝兮，得知王子心几烦而不绝兮，得知王子心几烦而不绝兮，得知王子。",
      textAlign: TextAlign.center,
      maxLines: 4, // 最多显示三行
      overflow: TextOverflow.ellipsis, // 如果一行显示不全，末尾...
      textScaleFactor: 1.5, //文字缩放
    );
  }
}
