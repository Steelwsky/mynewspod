import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/news_model.dart';
import 'widgets/news_items.dart';
import 'package:mynewspod/my_bottom_nav_bar.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 9,
            child: Container(
              child: Consumer<NewsModel>(builder: (context, news, _) {
                        return news.feed != null
                            ? NewsItems(rssFeed: news.feed)
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
