import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mynewspod/screens/favorite_page.dart';
import 'package:mynewspod/screens/new_stories.dart';
import 'package:pedantic/pedantic.dart';


class TabModel {
//  final int index;
  final String tabName;
  final String bottomName;
  final Icon icon;

  TabModel({this.tabName, this.bottomName, this.icon});
}

class BottomNavBarController {
  final ValueNotifier<int> state = ValueNotifier(0);

  List<TabModel> _tabs;


  void onItemTapped(int index) {
    state.value = index;
    print('index: $index');
  }

  BottomNavBarController() {
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
