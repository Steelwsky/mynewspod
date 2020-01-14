//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';
//import '../controllers/news_model.dart';
//
//class ExpandedNews extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final news = Provider.of<NewsModel>(context);
//    return Column(
//      children: [
//            SingleChildScrollView(
//              child: Column(children: [
////                Image.network(news.feed.image.url),
//                Padding(
//                  padding: const EdgeInsets.all(10),
//                  child: Column(
//                    children: <Widget>[
//                      Text(
//                        news.selectedItem.description.trim(),
//                        style: TextStyle(fontSize: 16),
//                      ),
//                       Row(
//                         children: <Widget>[
//                           FlatButton(
//                              padding: EdgeInsets.all(8),
//                              color: Colors.blue,
//                              textColor: Colors.white,
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  Text('Continue in browser:', style: TextStyle(fontSize: 18),),
//                                  Icon(Icons.open_in_browser),
//                                ],
//                              ),
//                              onPressed: () async {
//                                if(await canLaunch(news.selectedItem.link)) {
//                                  launch(news.selectedItem.link);
//                                }
//                              },
//                            ),
//                         ],
//                       ),
//                    ],
//                  ),
//                ),
//              ]),
//            )
//      ],
//    );
//  }
//}