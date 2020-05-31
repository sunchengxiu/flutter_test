import 'package:flutter/material.dart';

class SCXBottomBarItem extends BottomNavigationBarItem {
  SCXBottomBarItem(String imageName , String title)
      : super(
          icon: Image.asset(
            "assets/images/tabbar/${imageName}.png",
            width: 30,
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${imageName}_active.png",
            width: 30,
          ),
          title: Text(title),
        );
}
