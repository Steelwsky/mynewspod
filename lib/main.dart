import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:mynewspod/favorites.dart';
import 'package:mynewspod/home_page.dart';
import 'package:provider/provider.dart';
import 'controllers/news_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsModel()..parse(),
        ),
        Provider<BottomNavBarController>(create: (_) => BottomNavBarController()),
        Provider<TabNotifier>(create: (_) => TabNotifier(),),
//        ChangeNotifierProvider(create: (_) => BottomNavBarController(Provider.of<LoadingTabsCount>(context))),
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
