import 'package:flutter/material.dart';
import 'package:mynewspod/favorites.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myDatabase = Provider.of<MyDatabase>(context);
    return ListView(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      children: [Text('heelloo there')]
    );
  }
}
