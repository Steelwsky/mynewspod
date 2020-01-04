import 'package:flutter/material.dart';

class StarWidget extends StatefulWidget {
  @override
  _StarWidgetState createState() => _StarWidgetState();
}
class _StarWidgetState extends State<StarWidget> {
//   RssItem item;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: IconButton(
        icon:  Icon(
          Icons.star,
          size: 34,
          color: isFavorite == true ? Colors.amber : Colors.black12,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          print('changer is: $isFavorite');
        },
      ),
    );
  }
}



//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//class StarState {
//  bool state;
//
//  StarState({this.state = false});
//}
//
//class StarController {
//  final ValueNotifier<StarState> starState = ValueNotifier(StarState());
//
//  void changer() {
//    starState.value = StarState(state: !starState.value.state);
//  }
//}
//
//class StarWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final StarController starWidget = Provider.of<StarController>(context);
//    return ValueListenableBuilder<StarState>(
//        valueListenable: starWidget.starState,
//        builder: (_, newState, __) {
//          return Container(
//            width: 40,
//            child: IconButton(
//              icon: Icon(
//                Icons.star,
//                size: 34,
//                color: newState.state == true ? Colors.amber : Colors.black12,
//              ),
//              onPressed: () {
//                starWidget.changer();
//                print('changer is: ${newState.state}');
//              },
//            ),
//          );
//        });
//  }
//}


