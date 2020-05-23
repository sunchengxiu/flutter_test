import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("list view test"),
        ),
        body: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        // 设置cell
        itemBuilder: (BuildContext context , int index){
          return Text("ListView.sepatated : $index");
        },
        // 设置线
        separatorBuilder: (BuildContext context , int index){
          return Divider(
              color: Colors.black,
              height: 50,
              indent: 20,
              endIndent: 20,
            thickness: 1,
          );
        },
        itemCount: 100
    );
  }

  ListView buildListViewBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 100,
      // 相当于懒加载，展示的时候就会调用这个builder
      itemBuilder: (BuildContext context, int index) {
        // 返回一个 widget
        return Text("hello world : $index");
      });
  }

  ListView buildListView() {
    return ListView(
        // 行高大小
        itemExtent: 100,
        // 一次性直接加载，一般简单布局，可以使用，相对性能较差一点
        children: List.generate(100, (index) {
          return ListTile(
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.delete),
            title: Text("当前第$index行"),
            subtitle: Text("subtitle : $index"),
          );
        }));
  }
}
