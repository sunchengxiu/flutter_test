import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("gridView test"),
        ),
        body: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5
            ),
            itemBuilder: (BuildContext context , int index){
              return Container(
                height: 200,
                color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              );
            },
        ),
      ),
    );
  }

  Padding buildPaddingGridview() {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // item 想要占据的宽度
        maxCrossAxisExtent: 100
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
        );
      }),
    ),
  );
  }

  GridView buildGridView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 每行个数
            crossAxisCount: 5,
          // 夸高比例
          childAspectRatio: 1,

          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
        );
      }),
    );
  }
}
