import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';
import 'news_item.dart';
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
//        Flexible(child: Placeholder(), flex: 1,),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
