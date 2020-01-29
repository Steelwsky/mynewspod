import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mynewspod/screens/favorite_page.dart';
import 'package:mynewspod/screens/new_stories.dart';
import 'package:pedantic/pedantic.dart';


//class BottomNavBarController {
//  final ValueNotifier<int> state =
//  ValueNotifier(0); // - for first page: New stories
//
//  void onItemTapped(int index) {
//    state.value = index;
//    print('index: $index');
//  }
//
//}

class TabModel{
//  final int index;
  final String tabName;
  final String bottomName;
  final Icon icon;

  TabModel({this.tabName, this.bottomName, this.icon});
}

class TabHelper {
  List<TabModel> _tabs;

  TabHelper() {
    _tabs = [
      TabModel(
        tabName: 'New stories',
        bottomName: 'Stories',
        icon: Icon(Icons.home),
      ),
      TabModel(
        tabName: 'Favorite stories',
        bottomName: 'Favorites',
        icon: Icon(Icons.star),
      ),
    ];
  }

  List<Widget> _screenOptions = <Widget>[
    NewStories(
      index: 0,
    ),
    FavoritePage(
      index: 1,
    )
  ];

  UnmodifiableListView<Widget> get screenOptions =>
      UnmodifiableListView(_screenOptions);

  UnmodifiableListView<TabModel> get tabs => UnmodifiableListView(_tabs);
}

