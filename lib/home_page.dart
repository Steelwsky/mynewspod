import 'package:flutter/material.dart';
import 'package:mynewspod/controllers/controller_bottom_nav_bar.dart';
import 'package:mynewspod/widgets/my_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

//TODO implement common model for screens,
// but it's a bit strange due to different approach is used in favorite page: db data, not rssFeed/rssItems.
//TODO start with list of screens. upd: dunno what i meant
//TODO podcasts?
//TODO dark mode mb?


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bnbController = Provider.of<BottomNavBarController>(context);
    final tabNotifier = Provider.of<TabNotifier>(context);
    final tabs = tabNotifier.tabs;

    return ValueListenableBuilder<int>(
      valueListenable: bnbController.state,
      builder: (_, newState, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(tabs.elementAt(bnbController.state.value).tabName),
          ),
          body: tabNotifier.screenOptions.elementAt(newState),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}
