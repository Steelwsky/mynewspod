// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'news_model.dart';

class FavoriteModel extends ChangeNotifier {

  final RssFeed _feed;

  final List<int> _itemIds;

  FavoriteModel(this._feed, FavoriteModel previous)
      : assert(_feed != null),
        _itemIds = previous?._itemIds ?? [];

  /// An empty cart with no Catalog.
//  FavoriteModel.empty()
//      : _feed = null,
//        _itemIds = [];

  /// List of items in the cart.
//  List<RssItem> get items => _itemIds.map((id) => _feed.g;

  void add(RssItem item) {
    _itemIds.add(item.hashCode);
    notifyListeners();
  }
}
