import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:mynewspod/widgets/my_bottom_nav_bar.dart';
import 'screens/new_stories.dart';
import 'screens/favorite_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {

  static const List<Widget> screenOptions = <Widget>[
    NewStories(index: 0),
    FavoritePage(index: 1)
  ];


  @override
  Widget build(BuildContext context) {
    final bnbController = Provider.of<BottomNavBarController>(context);
    return ValueListenableBuilder<int>(
      valueListenable: bnbController.state,
      builder: (_, newState, __) {
        return Scaffold(
          appBar: AppBar(
            title: screenOptions.indexOf(screenOptions.elementAt(newState)) == 0 ? Text('New stories') : Text('Favorite stories'),
          ),
          body: screenOptions.elementAt(newState),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}


