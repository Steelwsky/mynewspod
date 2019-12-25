import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

class ExpandedNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context);
    return Column(
      children: [
        Flexible(
            flex: 8,
            child: SingleChildScrollView(
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
            )),
//        Flexible(
//          flex: 2,
//          child: Material(
//            elevation: 12,
//            child: Placeholder(),
//          ),
//        ),
      ],
    );
  }
}