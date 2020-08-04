import 'dart:ui';

import 'package:flutter/material.dart';

import 'home_request.dart';
class SCXHomeContent extends StatefulWidget {
  @override
  _SCXHomeContentState createState() => _SCXHomeContentState();
}

class _SCXHomeContentState extends State<SCXHomeContent> {
  @override
  void initState() {
    super.initState();
    HomeRequest.requestMoveList(0).then((value){
      print("--------");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页"),
    );
  }
}
