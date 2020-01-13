import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/news_model.dart';
import 'package:mynewspod/favorites.dart';
import 'package:provider/provider.dart';
import 'package:mynewspod/widgets/selected_news_page.dart';

class FavoritePage extends StatelessWidget {
  final int index;

  const FavoritePage({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myDatabase = Provider.of<MyDatabase>(context);
//    final news = Provider.of<NewsModel>(context);
    return Column(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: Container(
            child: StreamBuilder(
              stream: myDatabase.watchAllFavorites(),
              builder: (context, AsyncSnapshot<List<Favorite>> snapshot) {
                final favs = snapshot.data ?? List();
                return favs.length == 0
                    ? Text('There is no single story =/')
                    : ListView.builder(
                        key: PageStorageKey(index),
                        itemCount: favs.length,
                        itemBuilder: (_, index) {
                          final favItem = favs[index];
                          return ListTile(
                            title: Text(
                              favItem.title,
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              favItem.content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Container(
                                width: 40,
                                child: StreamBuilder<bool>(
                                    stream: myDatabase.isFavorite(favItem.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData && snapshot.data) {
                                        return IconButton(
                                          icon: Icon(Icons.star,
                                              size: 34, color: Colors.amber),
                                          onPressed: () => myDatabase
                                              .removeFavorite(favItem.id),
                                        );
                                      } else
                                        return IconButton(
                                          icon: Icon(Icons.star,
                                              size: 34, color: Colors.black12),
                                          onPressed: () {
                                            myDatabase
                                                .removeFavorite(favItem.id);
                                          },
                                        );
                                    })),
                            onTap: () {
//                              favs[index];

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => SelectedNewsPage()),
                              );
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

//onTap: () {
//news.selectedItem = i;
//Navigator.of(context).push(
//MaterialPageRoute(builder: (_) => SelectedNewsPage()),
//);
//},
