import 'package:douapp/pages/main/navi_items.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SCXMainPage extends StatefulWidget {
  @override
  _SCXMainPageState createState() => _SCXMainPageState();
}

class _SCXMainPageState extends State<SCXMainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 重叠界面
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      // 下面的 navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // 选中和未选中字体的大小
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // 选中文字颜色
        selectedItemColor: Colors.red,
        // 文字过长需要设置这个，否则文字不显示
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
