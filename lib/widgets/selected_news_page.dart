import 'package:flutter/material.dart';
import 'package:mynewspod/favorites.dart';
import 'package:provider/provider.dart';
import '../controllers/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedNewsPage extends StatelessWidget {
  SelectedNewsPage({
    Key key,
  }) : super(key: key);

  //TODO Add before Scaffold a conditional. it should check do we come from newStories page or favorite Page.
  // So, it decides the way of building page's content: using RssItem or database.
  // OR create another widget for db. don't know what is more suitable/better

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(Provider.of<NewsModel>(context).selectedItem.title)),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(children: [
//                Image.network(news.feed.image.url),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      news.selectedItem.description.trim(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.all(8),
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Continue in browser:',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.open_in_browser),
                            ],
                          ),
                          onPressed: () async {
                            if (await canLaunch(news.selectedItem.link)) {
                              launch(news.selectedItem.link);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
