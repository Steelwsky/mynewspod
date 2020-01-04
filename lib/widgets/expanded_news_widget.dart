import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';

class ExpandedNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsModel>(context);
    return Column(
      children: [
            SingleChildScrollView(
              child: Column(children: [
//                Image.network(news.feed.image.url),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    news.selectedItem.description.trim(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ]),
            )
      ],
    );
  }
}