import 'package:flutter/material.dart';

class RawContextItem{
  Widget item;
  Function onPressed;
  RawContextItem({
    required this.onPressed,
    required this.item,
  });
}
// ignore: must_be_immutable
class RawContext extends StatelessWidget {
  List<RawContextItem> items = [];
  Color iconColor;
  Color contextMenuColor;
  Color textColor;
  double? iconSize;
  double? textSize;
  String? font;
  Widget? child;
  RawContext({
    required this.items,
    this.iconColor = Colors.black,
    this.contextMenuColor = Colors.white,
    this.textColor = Colors.black,
    this.iconSize,
    this.textSize,
    this.font,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> popIt(){
      List<PopupMenuItem> poped = [];
      for(int i = 0; i < items.length; i++){
        poped.add(PopupMenuItem(
          child: items[i].item,
          value: i,
        ));
      }
      return poped;
    }
    return PopupMenuButton(
      color: contextMenuColor,
      onSelected: (selection){
        //Call its function
        items[selection as int].onPressed();
      },
      child: this.child ?? Icon(
        Icons.more_vert,
        color: iconColor,
        size: iconSize,
      ),
      itemBuilder: (context){
        return popIt();
      },
    );
  }
}
