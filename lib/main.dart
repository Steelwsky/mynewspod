import 'package:flutter/material.dart';
import 'package:mynewspod/home_page.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => NewsModel()..parse(),
      child: MaterialApp(
        title: 'News Feed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

