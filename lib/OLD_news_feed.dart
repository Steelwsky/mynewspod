//import 'package:flutter/material.dart';
//import 'package:webfeed/domain/rss_feed.dart';
//import 'news_item.dart';
//import 'package:http/http.dart' as http;
//import 'controller.dart';
//
//class NewsListFeed extends StatelessWidget {
//  NewsListFeed({Key key, this.rssFeed, this.title}) : super(key: key);
//  final String title;
//  final RssFeed rssFeed;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: FutureBuilder(
//        future: http.get(url),
//        builder: (_, AsyncSnapshot<http.Response> snapshot) {
//          if (snapshot.hasData) {
//            final response = snapshot.data;
//            if (response.statusCode == 200) {
//              final rssString = response.body;
//              var rssFeed = RssFeed.parse(rssString);
//              return Feed();
//            }
//            return null;
//          } else {
//            return Center(
//              child: CircularProgressIndicator(),
//            );
//          }
//        },
//      ),
//    );
//  }
//}
