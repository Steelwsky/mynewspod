import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:mynewspod/favorites.dart';
import 'package:mynewspod/home_page.dart';
import 'package:provider/provider.dart';
import 'controllers/news_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NewsController>(
          create: (context) => NewsController(),
        ),
        Provider<NewsItemController>(
          create: (context) => NewsItemController(),
        ),
//        Provider<BottomNavBarController>(create: (_) => BottomNavBarController()),
//        ChangeNotifierProvider<TabNotifier>(
//          create: (_) => TabNotifier(),
//        ),
        Provider<MyDatabase>(create: (_) => MyDatabase()),
      ],
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
