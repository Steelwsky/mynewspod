import 'package:flutter/material.dart';
import 'package:mynewspod/favorites.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/domain/rss_item.dart';
import '../controllers/news_controller.dart';
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
//    final news = Provider.of<NewsController>(context);
    final newsItem = Provider.of<NewsItemController>(context);
    return ValueListenableBuilder(
        valueListenable: newsItem.newsItemState,
        builder: (_, newState, __) {
          return Scaffold(
            appBar: AppBar(
          title: Text(newState.title)
            ),
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
                            newState.description,
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.all(8),
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      'Continue in browser:',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(Icons.open_in_browser),
                                  ],
                                ),
                                onPressed: () async {
                                  if (await canLaunch(newState.link)) {
                                    launch(newState.link);
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
        });
  }
}
