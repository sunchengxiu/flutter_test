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
    return ListView(
      children: List.generate(100, (index){
        return ListTile(
          leading: Icon(Icons.favorite),
          trailing: Icon(Icons.delete),
          title: Text("当前第$index行"),
          subtitle: Text("subtitle : $index"),
        );
      })
    );
  }
}