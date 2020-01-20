import 'package:flutter/material.dart';
import 'package:mynewspod/widgets/selected_news_page.dart';
import 'package:webfeed/domain/rss_feed.dart';
import '../controllers/news_controller.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/favorites.dart';

class NewsItems extends StatelessWidget {
  NewsItems({
    Key key,
    this.rssFeed,
    this.index,
  }) : super(key: key);
  final RssFeed rssFeed;
  final int index;
  bool isFav;
  Color color = Colors.black12;

  void printFavs(BuildContext context) async {
    print(await Provider.of<MyDatabase>(context).allFavorites);
  }

  @override
  Widget build(BuildContext context) {
    var myDatabase = Provider.of<MyDatabase>(context);
    final news = Provider.of<NewsController>(context);
    printFavs(context);
    return RefreshIndicator(
      key: Key('refreshKey'),
      onRefresh: () async {
        await news.fetchNews();
      },
      child: ListView(
        key: PageStorageKey(index),
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        children: news.feed.items
            .map(
              (i) => ListTile(
                key: PageStorageKey(i.guid),
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
                trailing: Container(
                    width: 40,
                    child: StreamBuilder<bool>(
                        stream: myDatabase.isFavorite(i.guid),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data) {
                            return IconButton(
                              icon: Icon(Icons.star,
                                  size: 34, color: Colors.amber),
                              onPressed: () =>
                                  myDatabase.removeFavorite(i.guid),
                            );
                          } else {
                            return IconButton(
                              icon: Icon(Icons.star,
                                  size: 34, color: Colors.black12),
                              onPressed: () {
                                myDatabase.addFavorite(i);
                              },
                            );
                          }
                        })),
                onTap: () {
//                  news.feed.items[2] = i;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SelectedNewsPage()),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
