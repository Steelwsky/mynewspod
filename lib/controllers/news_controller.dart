import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';
import 'package:pedantic/pedantic.dart';

final url = 'http://www.cnbc.com/id/19789731/device/rss/rss.xml';

//TODO the main purpose is to create a list of news (new + favorite) and use it in UI.
//TODO we need to check articles from DB here in parse method and return final list with fav/not fav news.

//TODO find out how to to clear model and controller which will definitely work!
//TODO make NewsController
//TODO make them FINAL

class NewsModel {
  List<RssFeed> currentNews;
}

class NewsController {
  NewsController (){
    fetchNews();
  }
  final _client = Client();
  final _feed = RssFeed();

  RssFeed get feed => _feed;


  // news - final list of news (new+fav), if it change - rebuild UI.
  final ValueNotifier newsState = ValueNotifier(null);


  Future<NewsModel> fetchNews() async {
    final res = await _client.get(url);
    final xmlStr = res.body;
    final parsedNews =  RssFeed.parse(xmlStr); // NewsController -> refresh, // RssFeed.parse is named constructor which returns RssFeed.
    newsState.value = parsedNews;
  }
}


//class NewsItemModel {
//   final RssItem rssItem;
//
//   NewsItemModel({this.rssItem});
//}

class NewsItemController {

//  final ValueNotifier<RssItem> newsItemState = ValueNotifier(RssItem());

  final ValueNotifier newsItemState = ValueNotifier(null);

//  RssItem setSelectedItem (RssItem value) {
//    newsItemState.value = value;
//  }

}
