import 'package:flutter/material.dart';

class RawContextItem{
  String optionText;
  Function onPressed;
  RawContextItem({@required this.onPressed,@required this.optionText});
}
// ignore: must_be_immutable
class RawContext extends StatelessWidget {
  List<RawContextItem> items = [];
  Color iconColor = Colors.black;
  Color contextMenuColor = Colors.white;
  Color textColor = Colors.black;
  double iconSize;
  double textSize;
  String font;
  RawContext({@required this.items,this.iconColor,this.contextMenuColor,this.textColor,this.iconSize,this.textSize,this.font});
  @override
  Widget build(BuildContext context) {
    List<String> itemsNames = [];
    List<PopupMenuItem> popIt(){
      List<PopupMenuItem> poped = [];
      items.forEach((item) {
        //Identify the text
        itemsNames.add(item.optionText);
        //Add to the popup list
        poped.add(PopupMenuItem(
          value: item.optionText,
          child: Text(
            item.optionText,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontFamily: font,
            ),
          ),
        ));
      });
      return poped;
    }
    return PopupMenuButton(
      color: contextMenuColor,
      onSelected: (selection){
        //Get the index of the selection
        int selectionIndex = itemsNames.indexOf(selection);
        //Call its function
        items[selectionIndex].onPressed();
      },
      icon: Icon(
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
