import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:flutter/foundation.dart';

final url = 'http://www.bbc.co.uk/music/genres/rockandindie/reviews.rss';

class News with ChangeNotifier {
  AtomFeed _feed;
  AtomItem _selectedItem;

  AtomFeed get feed => _feed;

  AtomItem get selectedItem => _selectedItem;

  set selectedItem(AtomItem value) {
    _selectedItem = value;
    notifyListeners();
  }

  void parse() async {
    final res = await http.get(url);
    final xmlStr = res.body;
    _feed = AtomFeed.parse(xmlStr);
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
