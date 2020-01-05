import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';

//final urlBbc = 'http://www.bbc.co.uk/music/genres/rockandindie/reviews.rss';
//final url = 'https://itsallwidgets.com/podcast/feed';
final url = 'http://www.cnbc.com/id/19789731/device/rss/rss.xml';

class NewsModel extends ChangeNotifier {
  RssFeed _feed;
  RssItem _selectedItem;
  bool isFavorite = false;

//  bool get isFavorite => _isFavorite;
  RssFeed get feed => _feed;

  RssItem get selectedItem => _selectedItem;

//  RssItem getById(int id) => _feed.items.elementAt(id);
//
//  RssItem getByPosition(int position) {
//    return getById(position);
//  }

  set selectedItem(RssItem value) {
    _selectedItem = value;
    notifyListeners();
  }

  void parse() async {
    final res = await http.get(url);
    final xmlStr = res.body;
    _feed = RssFeed.parse(xmlStr);
    notifyListeners();
  }

//  void parseBbc() async {
//    final res = await http.get(urlBbc);
//    final xmlStr = res.body;
//    _feed = RssFeed.parse(xmlStr);
//    notifyListeners();
//  }

//  void favoriteChanger(RssItem rssItem, bool isFav) {
//    isFavorite = !isFav;
//    notifyListeners();
//    print('rssItem: ${rssItem.hashCode}, isFavorite: $isFavorite, and isFav: $isFav');
//  }
}

//@immutable
//class Item {
//  final int id;
//  final
//}
