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

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView (
      children: <Widget>[
        // 每个小item
        MyHomeBodyItem("AJ", "这个是 AJ", "http://i0.hdslb.com/bfs/article/7e14a8d6f06c1efe862a77e7c7b82e476aaa1237.jpg"),
        SizedBox(height: 10,),
        MyHomeBodyItem("鲁班七号", "这个是鲁班七号", "http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20181218/5c5891062d374f46af6e2a0e592a95e5.jpeg"),
        SizedBox(height: 10,),
        MyHomeBodyItem("路虎", "这个是路虎", "http://img.pconline.com.cn/images/upload/upc/tx/auto5/1407/03/c0/35925048_1404357398594.jpg")
      ],
    );
  }
}

class MyHomeBodyItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;
  final style1 = TextStyle(color: Colors.blue,fontSize: 25);
  final style2 = TextStyle(color: Colors.green,fontSize: 30);
  MyHomeBodyItem(this.title,this.desc,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    // 做边框
    // 按住 option + enter 可以快速给一个 widget 添加widget
    return Container(
      // 距离边框的内边距
      padding: EdgeInsets.all(10),
      // 设置边框
      decoration: BoxDecoration(
        // 边框设置
        border: Border.all(
          width: 5,
          color: Colors.red
        )
      ),
      child: Column (
        // 设置交叉轴,让它居左显示
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 让文字居中
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(this.title,style: style1,),
              ],
            ),
            // 设置间距
            SizedBox(height: 10,),
            Text(this.desc,style: style2,),
            SizedBox(height: 10,),
            Image.network(this.imageUrl),
            SizedBox(height: 10,),
          ],
        ),
    );
  }
}