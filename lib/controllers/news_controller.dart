//import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';
import 'package:pedantic/pedantic.dart';

//final urlBbc = 'http://www.bbc.co.uk/music/genres/rockandindie/reviews.rss';
//final url = 'https://itsallwidgets.com/podcast/feed';
final url = 'http://www.cnbc.com/id/19789731/device/rss/rss.xml';

//TODO the main purpose is to create a list of news (new + favorite) and use it in UI.
//TODO we need to check articles from DB here in parse method and return final list with fav/not fav news.

//TODO find out how to to clear model and controller which will definitely work!

class NewsController {
  //TODO make them FINAL

  NewsController (){
    fetchNews();
  }

  final _feed = RssFeed();
  var _selectedItem = RssItem();
  final _client = Client();
  final bool isFavorite = false;

  RssFeed get feed => _feed;


  // news - final list of news (new+fav), if it change - rebuild UI.
  final ValueNotifier news = ValueNotifier(null);

  //TODO make NewsController

  RssItem get selectedItem => _selectedItem;

  set selectedItem(RssItem value) {
    _selectedItem = value;
  }

  Future<News> fetchNews() async {
    final res = await _client.get(url);
    final xmlStr = res.body;
    final parsedNews =  RssFeed.parse(xmlStr); // NewsController -> refresh, // RssFeed.parse is named constructor which returns RssFeed.
    news.value = parsedNews;
  }
}

class News {
  List<RssFeed> currentNews;
}
