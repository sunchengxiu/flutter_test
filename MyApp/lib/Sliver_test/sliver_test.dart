import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context , int index){
              return ListTile(
                leading: Icon(Icons.add),
                title: Text("slivere list"),
              );
            },
            childCount: 10,
            )

        ),
        SliverGrid(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              // 在 GridView 里面要构建的东西
              return Container(
                color: Color.fromARGB(255, Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255)),
              );
            },
                // 最大滚动个数
                childCount: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5))
      ],
    );
  }
}

CustomScrollView buildCustomScrollView() {
  // 在这里也可以加 safearea，但是滚动的话就滚动不到头了，上面会有一块空白
  return CustomScrollView(
    slivers: <Widget>[
      // 传入要构建的 sliver ， 比如 listview gridview
      // 安全区域,在这里加安全区域可以滚动到头部
      SliverSafeArea(
          // 然后给加一个内边距,这个内边距是可以滚动的，如果加padding 的话，上面的空白边距是不能滚动的
          sliver: SliverPadding(
        padding: EdgeInsets.all(5),
        sliver: SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              // 在 GridView 里面要构建的东西
              return Container(
                color: Color.fromARGB(255, Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255)),
              );
            },
                    // 最大滚动个数
                    childCount: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5)),
      ))
    ],
  );
}
