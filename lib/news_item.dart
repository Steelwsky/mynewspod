import 'package:flutter/material.dart';
import 'package:mynewspod/news_page.dart';
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
              trailing:  GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Provider.of<News>(context).favoriteChanger();
                  print('changer is: ${news.isFavorite}');
                },
                child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.star,
                    size: 34,
                    color: news.isFavorite == true ? Colors.amber : Colors.black12,
                  ),
                ),
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
