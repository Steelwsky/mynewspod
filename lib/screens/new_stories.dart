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
    final news = Provider.of<NewsController>(context);
    return ValueListenableBuilder(
        valueListenable: news.newsState,
        builder: (context, newsBuilder, _) {
          return news.newsState.value.items != null
              ? NewsItems(
                  index: index,
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
