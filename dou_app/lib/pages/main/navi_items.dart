
import 'navi_bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:douapp/pages/home/home_main.dart';
import 'package:douapp/pages/subject/subject_main.dart';


List<SCXBottomBarItem> items = [
  SCXBottomBarItem("home", "首页"),
  SCXBottomBarItem("subject", "书影音"),
  SCXBottomBarItem("group", "小组"),
  SCXBottomBarItem("mall", "市集"),
  SCXBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  SCXHomePage(),
  SCXSubjectPage(),
  SCXHomePage(),
  SCXHomePage(),
  SCXSubjectPage(),
  SCXHomePage(),
];