import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';
import 'package:webfeed/webfeed.dart';

class StarWidget extends StatelessWidget {
  final RssItem item;

  const StarWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<News>(context);
    return Container(
      width: 50,
      child: FlatButton(
        onPressed: () {
          Provider.of<News>(context).favoriteChanger();
          print('changer is: ${news.isFavorite}');
        },
        child: Container(
            width: 40,
            alignment: Alignment.center,
            child:
            news.isFavorite == true ? Icon(
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
  }
}