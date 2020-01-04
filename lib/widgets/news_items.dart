import 'package:flutter/material.dart';
import 'package:mynewspod/news_page.dart';
import 'package:mynewspod/widgets/star_widget.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import '../models/news_model.dart';
import 'package:provider/provider.dart';

class NewsItems extends StatelessWidget {
  NewsItems({Key key, this.rssFeed, this.rssItem}) : super(key: key);
  final RssFeed rssFeed;
  final RssItem rssItem;
  bool isFav;
  Color color = Colors.black12;

  @override
  Widget build(BuildContext context) {
//    var favs = Provider.of<FavoriteModel>(context);
    final news = Provider.of<NewsModel>(context);
    return RefreshIndicator(
      key: Key('refreshKey'),
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 100));
        await news.parse();
      },
      child: ListView(
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
                trailing:
//              StreamBuilder<bool>(
//                stream: null,
//                builder: (context, snapshot) {
//                  return IconButton(icon: Icon(Icons.star_border), onPressed: () => null);
//                }
//              ),
                    StarWidget(),
                onTap: () {
                  news.selectedItem = i;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => NewsPage()),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

//class MyStarIcon extends StatelessWidget {
//  const MyStarIcon({
//    Key key,
//    @required this.item,
//    @required this.color,
//  }) : super(key: key);
//
//  final RssItem item;
//  final Color color;
//
//  @override
//  Widget build(BuildContext context) {
//    var news = Provider.of<NewsModel>(context);
//    return Icon(
//        Icons.star,
//        size: 34,
//        color: color,
//    );
//  }
//}

//
//Container(
//width: 50,
//child: IconButton(
//icon: MyStarIcon(item: i, color: color,),
//onPressed: () {
//news.favoriteChanger(i, isFav);
//if((isFav == true)) {
//color = Colors.amber;
//print('isFavFALSE: $isFav');
//isFav = false;
//return;
//} else {
//color = Colors.black12;
//isFav = true;
//print('isFavTRUE: $isFav');
//}
//},
//),
//),
