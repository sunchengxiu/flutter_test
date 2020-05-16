import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: MyHome(),
    );
  }
}

// 整体界面 home
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "app bar",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: MyHomeBody(),
    );
  }
}


// body
class MyHomeBody extends StatefulWidget {
  // 因为当前这个类是不可变的，因为他继承 StatelessWidget，里面定义的类也是不可变的，var 是没有用的，所以必须为final
  final toValue = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Row(
        // 主轴布局,居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(value: true, onChanged: (value){
            print(value);
          }),
          Text("hello world"),
        ],
      ),
    );
  }

  // 维护创建状态
  @override
  State<StatefulWidget> createState() {
    return MyHomeBodyState();
  }
}

class MyHomeBodyState extends State<MyHomeBody> {
  var stateFlag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // 居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: stateFlag,
              onChanged: (value){
                setState(() {
                  stateFlag = value;
                  print(value);
                });
              }),
          Text("hello world"),
        ],
      ),
    );
  }

}











// body
class MyHomeBody1 extends StatelessWidget {
  // 因为当前这个类是不可变的，因为他继承 StatelessWidget，里面定义的类也是不可变的，var 是没有用的，所以必须为final
  final toValue = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Row(
        // 主轴布局,居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(value: true, onChanged: (value){
            print(value);
          }),
          Text("hello world"),
        ],
      ),
    );
  }
}