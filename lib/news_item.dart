import 'package:flutter/material.dart';
import 'package:mynewspod/news_page.dart';
import 'package:mynewspod/star_widget.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'controller.dart';
import 'package:provider/provider.dart';

class NewsItems extends StatelessWidget {
  NewsItems({Key key, this.rssFeed}) : super(key: key);
  final RssFeed rssFeed;

  @override
  Widget build(BuildContext context) {
//    var changer = false;
    final news = Provider.of<News>(context);
    return ListView(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      children: rssFeed.items
          .map(
            (i) => ListTile(
              title: Text(
                i.title,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                i.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
              trailing: StarWidget(item: Provider.of<News>(context).selectedItem),
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
