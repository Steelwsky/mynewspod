import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

// dunno what im doing here..

class MyBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<BottomNavBarController>(context); // make this widget stful and
//    final tabNotifier = TabHelper();
    return BottomNavigationBar(
        items: [
          ...bottomNavController.tabs.map((tab) => BottomNavigationBarItem(
                icon: tab.icon,
                title: Text(tab.tabName),
              ))
        ],
        currentIndex: bottomNavController.state.value,
        selectedItemColor: Colors.blue,
        onTap: bottomNavController.onItemTapped);
  }
}
