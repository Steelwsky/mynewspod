import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';
import 'package:webfeed/webfeed.dart';

class StarWidget extends StatelessWidget {
  final RssItem item;
  final bool isFavorite;

  const StarWidget({Key key, @required this.item, @required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<NewsModel>(context);
//    return Consumer<News>(builder: (context, newState, child) {
      return Container(
        width: 50,
        child: FlatButton(
          onPressed: () {
            news.favoriteChanger(news.selectedItem);
            print('changer is: ${news.isFavorite}');
          },
          child: Container(
              width: 40,
              alignment: Alignment.center,
              child: news.isFavorite == true ? Icon(
                  Icons.star, size: 34, color: Colors.amber) : Icon(
                  Icons.star, size: 34, color: Colors.black26)
//            Icon(
//              Icons.star,
//              size: 34,
//              color: news.isFavorite == true ? Colors.amber : Colors.black12,
//            ),
          ),
        ),
      );
//    }

  }
}