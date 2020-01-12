import 'package:flutter/material.dart';

//class LoadingTabsCount {
//
//}

class BottomNavBarController {
  final ValueNotifier<int> state = ValueNotifier(0);
//  BottomNavBarController({this.selectedIndex = 0});
//  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static const List<Widget> screenOptions = <Widget>[
//    NewStories(),
//    FavoritePage()
//  ];

//  final PageController _pageController = PageController();


  void onItemTapped(int index) {
//      _pageController.animateToPage(index,
//          duration: const Duration(milliseconds: 300),
//          curve: Curves.easeOutCubic);
      state.value = index;
      print('index: $index');
  }
}