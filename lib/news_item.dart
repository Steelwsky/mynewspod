import 'package:flutter/material.dart';
import 'package:mynewspod/news_page.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'controller.dart';
import 'package:provider/provider.dart';

class NewsItems extends StatelessWidget {
  NewsItems({Key key, this.rssFeed}) : super(key: key);
  final RssFeed rssFeed;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
      children: rssFeed.items
          .map(
            (i) => ListTile(
          title: Text(i.title),
          subtitle: Text(
            i.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Provider.of<News>(context).selectedItem = i;
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NewsPage()),
            );
          },
        ),
      )
          .toList(),

    );
  }
}
