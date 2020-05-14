import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "app bar",
              style: TextStyle(fontSize: 30),
            ),
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
