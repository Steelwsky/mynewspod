import 'package:flutter/material.dart';
import 'package:mynewspod/favorites.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedFavPage extends StatelessWidget {
  final String id;

  SelectedFavPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myDatabase = Provider.of<MyDatabase>(context);
    return StreamBuilder(
      stream: myDatabase.entryById(id),
      builder: (context, AsyncSnapshot<Favorite> snapshot) {
        final fav = snapshot.data;
        return Scaffold(
          appBar: AppBar(
              title: Text(fav.title)),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  fav.content,
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
                        if (await canLaunch(fav.link)) {
                          launch(fav.link);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
