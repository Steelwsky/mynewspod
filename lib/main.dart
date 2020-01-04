import 'package:flutter/material.dart';
import 'package:mynewspod/home_page.dart';
import 'package:mynewspod/widgets/star_widget.dart';
import 'package:provider/provider.dart';
import 'models/news_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsModel()..parse(),),
//        Provider<StarController>(create: (_) => StarController(),)
//        ChangeNotifierProvider(create: (_) => FavoriteModel(),)
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

