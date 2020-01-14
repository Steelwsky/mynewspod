import 'package:moor_flutter/moor_flutter.dart';
import 'package:mynewspod/controllers/news_model.dart';
import 'package:webfeed/domain/rss_item.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'favorites.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Favorites extends Table {
//  IntColumn get id => integer().customConstraint('UNIQUE')();
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get content => text()();

  TextColumn get link => text()();
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [Favorites])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db5.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> get allFavorites => select(favorites).get();

//  Future<List<Favorite>> get selectedFavorite => select(favorites.).get();

  Stream<List<Favorite>> watchAllFavorites() => select(favorites).watch();

  Stream<Favorite> entryById(String id) {
    return (select(favorites)..where((favorite) => favorite.id.equals(id))).watchSingle();
  }

  /*
  select favorite.title from favorite
  where favorite.id = '000132'

   */

  NewsModel newsModel;

  void addFavorite(RssItem f) {
    var favorite = Favorite(
      id: f.guid,
      title: f.title,
      content: f.description,
      link: f.link,
    );
    into(favorites).insert(favorite);
  }

  void removeFavorite(String id) =>
      (delete(favorites)..where((t) => t.id.equals(id))).go();

  // watches all todo entries in a given category. The stream will automatically
  // emit new items whenever the underlying data changes.
  Stream<bool> isFavorite(String id) {
    return select(favorites).watch().map((favoritesList) =>
        favoritesList.where((favorite) => favorite.id == id).length >= 1);
  }
}
