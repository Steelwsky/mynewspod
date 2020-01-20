import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnbController = Provider.of<BottomNavBarController>(
        context); // make this widget stful and
    final tabNotifier = Provider.of<TabNotifier>(context);
    return BottomNavigationBar(
        items: [
          ...tabNotifier.tabs.map((tab) => BottomNavigationBarItem(
                icon: tab.icon,
                title: Text(tab.tabName),
              ))
        ],
        currentIndex: bnbController.state.value,
        selectedItemColor: Colors.blue,
        onTap: bnbController.onItemTapped);
  }
}
