import 'package:flutter/material.dart';

class MyNewsFeed extends StatelessWidget {
  MyNewsFeed({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C',];
    final List<int> colorCodes = <int>[600, 500, 100, ];
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            )));
  }
}
