import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';

//final url = 'http://www.bbc.co.uk/music/genres/rockandindie/reviews.rss';
//final url = 'https://itsallwidgets.com/podcast/feed';
final url = 'http://www.cnbc.com/id/19789731/device/rss/rss.xml';

class News with ChangeNotifier {
  RssFeed _feed;
  RssItem _selectedItem;
  bool isFavorite = false;

//  bool get isFavorite => _isFavorite;
  RssFeed get feed => _feed;

  RssItem get selectedItem => _selectedItem;

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

  void favoriteChanger() {
    isFavorite = !isFavorite;
}

//Future<String> _getDownloadPath(String filename) async {
//  final dir = await getApplicationDocumentsDirectory();
//  final prefix = dir.path;
//  final absolutePath = path.join(prefix, filename);
//  print(absolutePath);
//  return absolutePath;
//}
//
//  void download(RssItem item, [Function(double) callback]) async {
//    final req = http.Request('GET', Uri.parse(item.guid));
//    final res = await req.send();
//    if (res.statusCode != 200)
//      throw Exception('Unexpected HTTP code: ${res.statusCode}');
//
//    final contentLength = res.contentLength;
//    var downloadedLength = 0;
//
//    final file = File(await _getDownloadPath(path.split(item.guid).last));
//    res.stream
//        .map((chunk) {
//      downloadedLength += chunk.length;
//      if (callback != null) callback(downloadedLength / contentLength);
//      return chunk;
//    })
//        .pipe(file.openWrite())
//        .whenComplete(() {
//      print('Downloading complete');
//    })
//        .catchError((e) => print('An Error has occurred!!!: $e'));
//  }
}
