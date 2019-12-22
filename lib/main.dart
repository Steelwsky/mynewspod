import 'package:flutter/material.dart';
import 'package:mynewspod/OLD_news_feed.dart';
import 'package:mynewspod/news_page.dart';
import 'package:provider/provider.dart';
import 'OLD_news_feed.dart';
import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => News()..parse(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyNewsPage(),
      ),
    );
  }
}

