import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
//    final bnbController = Provider.of<BottomNavBarController>(context); // make this widget stful and
//    final tabNotifier = Provider.of<TabNotifier>(context);
    final tabNotifier = TabHelper();
    return BottomNavigationBar(
        items: [
          ...tabNotifier.tabs.map((tab) => BottomNavigationBarItem(
                icon: tab.icon,
                title: Text(tab.tabName),
              ))
        ],
        currentIndex:_selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped);
  }
}
