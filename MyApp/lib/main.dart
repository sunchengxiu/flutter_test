import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("app bar"),
          ),
          body: Center(
            child:Text(
              "hello world",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green
              ),
            ) ,
          ),
        )
    )
  );
}
