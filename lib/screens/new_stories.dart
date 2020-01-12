import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/controllers/news_model.dart';
import 'package:mynewspod/widgets/news_items.dart';

class NewStories extends StatelessWidget {
  const NewStories({
    Key key,
    String tabName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: Container(
            child: Consumer<NewsModel>(builder: (context, news, _) {
              return news.feed != null ? NewsItems(rssFeed: news.feed) : Center(child: CircularProgressIndicator());
            }),
          ),
        ),
      ],
    );
  }
}
