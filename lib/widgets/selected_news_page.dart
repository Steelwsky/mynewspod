import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/news_model.dart';
import 'package:mynewspod/widgets/expanded_news_widget.dart';

class SelectedNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<NewsModel>(context).selectedItem.title,
        ),
      ),
      body: SafeArea(child: ExpandedNews()),
    );
  }
}
