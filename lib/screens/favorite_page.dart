import 'package:flutter/material.dart';
import 'package:mynewspod/favorites.dart';
import 'package:mynewspod/widgets/selected_fav_page.dart';
import 'package:provider/provider.dart';
import 'package:pedantic/pedantic.dart';

class FavoritePage extends StatelessWidget {
  final int index;

  const FavoritePage({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myDatabase = Provider.of<MyDatabase>(context);
//    final news = Provider.of<NewsModel>(context);
    return Column(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: Container(
            child: StreamBuilder(
              stream: myDatabase.watchAllFavorites(),
              // TODO function favorController (remove, add)
              builder: (context, AsyncSnapshot<List<Favorite>> snapshot) {
                //<List<Favorite>> to <FavList>
                final favs = snapshot.data ?? List();
                return favs.isEmpty
                    ? Text('There is no single story =/') //TODO when i go to fav stories this text shows like 5 frames. I need to load at first then show result
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
                                child: StreamBuilder<bool>(  //TODO wrong implementation. i don't need to check here for hasData. totally wrong!!!
                                    //convert to ValueNotifier
                                    stream: myDatabase.isFavorite(favItem.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData && snapshot.data) {
                                        return IconButton(
                                          icon: Icon(Icons.star,
                                              size: 34, color: Colors.amber),
                                          onPressed: () => myDatabase
                                              .removeFavorite(favItem.id),
                                        );
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    })),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        SelectedFavPage(id: favItem.id)),
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
