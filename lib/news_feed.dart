import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'feed_widget.dart';
import 'package:http/http.dart' as http;
import 'controller.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: http.get(url),
        builder: (_, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            final response = snapshot.data;
            if (response.statusCode == 200) {
              final rssString = response.body;
              var rssFeed = RssFeed.parse(rssString);
              return Feed();
            }
            return null;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
