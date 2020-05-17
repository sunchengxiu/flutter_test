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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期测试"),
      ),
        body: MyHomePage(),
    );
  }
}
//
class MyHomePage extends StatefulWidget{
  MyHomePage(){
    print("1. 调用 MyHome 构造方法");
  }
  @override
  State<StatefulWidget> createState() {
    print("2. 调用 MyHome 的 createState 方法");
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHomePage>{
  var _count = 0;
  MyHomeState(){
    print("3. 调用 MyHomeState 的构造方法");
  }
  @override
  void initState() {
    print("4. 调用 MyHomeState 的  initState 方法");
    // 必须调用 super
    super.initState();
  }
  @override
  void didChangeDependencies() {
    print("6. 调用 MyHomeState didChangeDependencies方法");
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    print("7. 调用 MyHomeState didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  // 每次点击 + 号的时候，只会调用我们生命周期函数的 build 方法。
  Widget build(BuildContext context) {
    print("5. 调用 MyHomeState 的  build 方法");
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: (){
            // 当我们每次点击 + 按钮的时候，每次都会执行这里
            setState(() {
              _count ++;
             });
          },
          child: Icon(Icons.add),
        ),
        Text("计数器:$_count"),
      ],
    );
  }

  @override
  void dispose() {
    // 6. 最后调用 dispose 方法
    super.dispose();
  }
}

