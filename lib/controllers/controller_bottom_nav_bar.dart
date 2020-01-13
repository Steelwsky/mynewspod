import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mynewspod/screens/favorite_page.dart';
import 'package:mynewspod/screens/new_stories.dart';

class BottomNavBarController {
  final ValueNotifier<int> state =
      ValueNotifier(0); // - for first page: New stories

  void onItemTapped(int index) {
    state.value = index;
    print('index: $index');
  }
}

class TabModel with ChangeNotifier {
//  final int index;
  final StoriesType storiesType;
  final String tabName;
  final String bottomName;
  final Icon icon;

  TabModel({this.storiesType, this.tabName, this.bottomName, this.icon});
}

class TabNotifier with ChangeNotifier {
  List<TabModel> _tabs;

  TabNotifier() {
    _tabs = [
      TabModel(
        storiesType: StoriesType.newStories,
        tabName: 'New stories',
        bottomName: 'Stories',
        icon: Icon(Icons.home),
      ),
      TabModel(
        storiesType: StoriesType.favoriteStories,
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

enum StoriesType {
  newStories,
  favoriteStories,
}
