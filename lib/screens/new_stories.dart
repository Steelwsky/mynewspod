import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/controllers/news_controller.dart';
import 'package:mynewspod/widgets/news_items.dart';

class NewStories extends StatelessWidget {
  final int index;

  const NewStories({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<NewsController>(builder: (context, news, _) {
        return news.feed != null
            ? NewsItems(
                rssFeed: news.feed,
                index: index,
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
