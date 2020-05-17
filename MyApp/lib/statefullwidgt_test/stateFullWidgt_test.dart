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
        title: Text("column 练习"),
      ),
      body: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeBodyState();
  }

}

// 前面加 _ , 内部使用，外部访问不了
class _MyHomeBodyState extends State<MyHomeBody> {
  int _cout = 0;
  @override
  Widget build(BuildContext context) {
    return Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_cout"),
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("+"),
          color: Colors.red,
          onPressed: () {
            setState(() {
              _cout++;
            });
          },
        ),
        RaisedButton(
          child: Text("-"),
          color: Colors.blue,
          onPressed: (){
            setState(() {
              _cout --;
            });
          },
        ),
      ],
    );
  }
}