import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';
import 'package:pedantic/pedantic.dart';
import 'package:mynewspod/favorites.dart';

final _url = 'http://www.cnbc.com/id/19789731/device/rss/rss.xml';

//TODO the main purpose is to create a list of news (new + favorite) and use it in UI.
//TODO we need to check articles from DB here in parse method and return final list with fav/not fav news.

//TODO find out how to to clear model and controller which will definitely work!
//TODO make NewsController
//TODO make them FINAL

class NewsModel {
  List<RssFeed> currentNews;
}

class NewsController {
  NewsController() {
    fetchNews();
  }

  final _client = Client();
  final favoriteController = FavoriteController();


  // news - final list of news (new+fav), if it change - rebuild UI.
  final ValueNotifier<RssFeed> newsState = ValueNotifier(RssFeed());


  Future<NewsModel> fetchNews() async {
    final res = await _client.get(_url);
    final xmlStr = res.body;
    final parsedNews = RssFeed.parse(xmlStr); // NewsController -> refresh, // RssFeed.parse is named constructor which returns RssFeed.
//    final NewsItems newsItems = NewsItems(isFav: favoriteController.checkFavoriteInParsedNews);
    newsState.value = parsedNews;
//    parsedNews.items.elementAt(1).
  }

}

class NewsItemController {
  final ValueNotifier<RssItem> newsItemState = ValueNotifier(RssItem());
}

class FavoriteController {

  bool checkFavoriteInParsedNews(String id) {
    final myDataBase = MyDatabase();
    final item = myDataBase.isFavorite(id);
    if (item == true) {
      return true;
    } else {
      return false;
    }
  }

}


// final News = SingleNews (news: mappedNewsFromRaw[0], isFav: favController.isFavorite);

//TODO make a method checking the list and finding favorite ones and if they are - mark them and use this mark when ui builds
