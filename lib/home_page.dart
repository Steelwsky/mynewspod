import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';
import 'news_item.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<News>(builder: (context, news, _) {
        return news.feed != null
            ? NewsItems(rssFeed: news.feed)
            : Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
