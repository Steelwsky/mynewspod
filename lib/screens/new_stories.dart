import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/controllers/news_controller.dart';
import 'package:mynewspod/widgets/news_items.dart';
import 'package:webfeed/domain/rss_feed.dart';

class NewStories extends StatelessWidget {
  final int index;

  const NewStories({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsController>(context);
    return ValueListenableBuilder<RssFeed>(
        valueListenable: news.newsState.value,
        builder: (_, newState, __) {
          return news.feed != null
              ? NewsItems(
                  rssFeed: news.feed,
                  index: index,
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
