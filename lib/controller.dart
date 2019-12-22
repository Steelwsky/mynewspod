import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';

final url = 'https://www.reddit.com/.rss';

final pathSuffix = 'dashcast/downloads';

class News with ChangeNotifier {
  RssFeed _feed;
  RssItem _selectedItem;

  RssFeed get feed => _feed;

  RssItem get selectedItem => _selectedItem;

  set selectedItem(RssItem value) {
    _selectedItem = value;
    notifyListeners();
  }

  void parse(String url) async {
    final res = await http.get(url);
    final xmlStr = res.body;
    _feed = RssFeed.parse(xmlStr);
    notifyListeners();
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
