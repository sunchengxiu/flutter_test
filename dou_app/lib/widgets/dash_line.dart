import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';
class SCXDashLine extends StatelessWidget {
  // 虚线的排列方向
  final Axis axis;
  // 虚线的个数
  final int cout;
  // 虚线的宽度
  final double dashWidth;
  // 虚线的高度
  final double dashHeight;
  // 虚线的颜色
  final Color dashColor;
  SCXDashLine({
    this.axis = Axis.horizontal,
    this.cout = 10,
    this.dashHeight = 1,
    this.dashWidth = 5,
    this.dashColor = Colors.red,
  });
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(cout, (index) {
        return SizedBox(
          width: dashWidth,
          height: dashHeight,
          child: DecoratedBox(decoration: BoxDecoration(color: dashColor)),
        );
      }),
    );
  }
}