import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SCXStar(grade: 4.5),
    );
  }
}

class SCXStar extends StatefulWidget {
  // SCXStar({Key key, this.title}) : super(key: key);
  final String title = "Dou APP";
  // 分数
  final double grade;
  // 总分
  final double totalGrade;
  // 星的个数
  final int count;
  // 星的大小
  final double size;
  // 没有选中的颜色
  final Color normalColor;
  // 选中的颜色
  final Color selectColor;
  // 未选中情况下的image
  final Widget unselectImage;
  // 选中情况下的image
  final Widget selectImage;
  SCXStar({
    @required this.grade,
    this.totalGrade = 5,
    this.count = 5,
    this.size = 30,
    this.normalColor = const Color(0xffbbbbbb), //RGB,需要时常亮，前面加 const
    this.selectColor = Colors.red,
    Widget unselectImage,
    Widget selectImage,
  })  : unselectImage = unselectImage ??
            Icon(
              Icons.star_border,
              color: normalColor,
              size: size,
            ),
        selectImage = selectImage ??
            Icon(
              Icons.star,
              color: selectColor,
              size: size,
            );
  @override
  _SCXStarPageState createState() => _SCXStarPageState();
}

class _SCXStarPageState extends State<SCXStar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: buildNormalStar(),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: buildSelectStar(),
              ),
            ],
          ),
        ));
  }

  // 构建未选中的 star
  List<Widget> buildNormalStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectImage;
    });
  }

  // 构建 选中的star
  List<Widget> buildSelectStar() {
    List<Widget> starts = [];
    // 每一个星代表的分数
    double everyScore = widget.totalGrade / widget.count;
    // 全部需要填充的个数
    int allCount = (widget.grade / everyScore).floor();
    // 剩余小数点分数
    double leftScore = widget.grade / everyScore - allCount;
    final Widget star = widget.selectImage;
    List.generate(allCount, (index) {
      starts.add(star);
    });

    double from = leftScore * widget.size;
    // 构建半截星
    final otherStar = ClipRect(
      child: star,
      clipper: SCXCustomClipper(from),
    );
    starts.add(otherStar);
    if (starts.length > widget.count){
      return starts.sublist(0,widget.count);
    }
    return starts;
  }
}

class SCXCustomClipper extends CustomClipper<Rect> {
  final clipFrom;
  SCXCustomClipper(this.clipFrom);
  // 需要裁剪的 size
  @override
  getClip(Size size) {
    return Rect.fromLTRB(0, 0, clipFrom, size.height);
  }

  @override
  bool shouldReclip(SCXCustomClipper oldClipper) {
    // 不相等的时候需要裁剪
    return oldClipper.clipFrom != this.clipFrom;
  }
}
