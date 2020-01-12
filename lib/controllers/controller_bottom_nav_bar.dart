import 'package:flutter/material.dart';

class BottomNavBarController {
  final ValueNotifier<int> state = ValueNotifier(0);

  void onItemTapped(int index) {
      state.value = index;
      print('index: $index');
  }
}