import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnbController = Provider.of<BottomNavBarController>(context);
       return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text('Favorites'),
              ),
            ],
            currentIndex: bnbController.state.value,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              bnbController.onItemTapped(index);
            }
       );
      }
  }

