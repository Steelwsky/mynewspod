import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:mynewspod/widgets/my_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/widgets/new_bottom_nav_bar.dart';

//TODO implement common model for screens,
// but it's a bit strange due to different approach is used in favorite page: db data, not rssFeed/rssItems.
//TODO start with list of screens. upd: dunno what i meant
//TODO podcasts?
//TODO dark mode mb?

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO Deal with tabController, make it stfl and simple
    final bottomNavBarController = Provider.of<BottomNavBarController>(context);
    return ValueListenableBuilder<int>(
        valueListenable: bottomNavBarController.state,
        builder: (_, newState, __) {
          return Scaffold(
            appBar: AppBar(
                title: Text(bottomNavBarController.tabs
                    .elementAt(bottomNavBarController.state.value)
                    .tabName)),
            body: bottomNavBarController.screenOptions.elementAt(newState),
            bottomNavigationBar: MyBottomNavigationBar(),
//        NewBottomNavBar(),
          );
        });
  }
}
