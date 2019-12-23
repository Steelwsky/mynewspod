import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';
import 'package:mynewspod/expanded_news_widget.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<News>(context).selectedItem.title,
        ),
      ),
      body: SafeArea(child: ExpandedNews()),
    );
  }
}