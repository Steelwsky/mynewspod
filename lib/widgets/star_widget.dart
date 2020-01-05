//import 'package:flutter/material.dart';
//import 'package:mynewspod/models/news_model.dart';
//import 'package:provider/provider.dart';
//import 'package:mynewspod/favorites.dart';
//
//class StarWidget extends StatefulWidget {
//  @override
//  _StarWidgetState createState() => _StarWidgetState();
//}
//class _StarWidgetState extends State<StarWidget> {
//  bool isFavorite = false;
//  NewsModel newsModel;
//
//  @override
//  Widget build(BuildContext context) {
//        return Container(
//          width: 40,
//          child: StreamBuilder<bool>(
//            stream: Provider.of<MyDatabase>(context).isFavorite(newsModel.selectedItem.hashCode),
//            builder: (context, snapshot) {
//              if (snapshot.hasData && snapshot.data) {
//                return IconButton(
//                  icon: Icon(Icons.star, size: 34, color:  Colors.amber),
//                  onPressed: null,
//                );
//              }
//            return IconButton(
//              icon: Icon(Icons.star, size: 34, color:  Colors.black12),
//              onPressed: null,
//            );
//            }
//          ),
//        );
//
//
//  }
//}
//
//
//
////import 'package:flutter/material.dart';
////import 'package:provider/provider.dart';
////
////class StarState {
////  bool state;
////
////  StarState({this.state = false});
////}
////
////class StarController {
////  final ValueNotifier<StarState> starState = ValueNotifier(StarState());
////
////  void changer() {
////    starState.value = StarState(state: !starState.value.state);
////  }
////}
////
////class StarWidget extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    final StarController starWidget = Provider.of<StarController>(context);
////    return ValueListenableBuilder<StarState>(
////        valueListenable: starWidget.starState,
////        builder: (_, newState, __) {
////          return Container(
////            width: 40,
////            child: IconButton(
////              icon: Icon(
////                Icons.star,
////                size: 34,
////                color: newState.state == true ? Colors.amber : Colors.black12,
////              ),
////              onPressed: () {
////                starWidget.changer();
////                print('changer is: ${newState.state}');
////              },
////            ),
////          );
////        });
////  }
////}
//
//
