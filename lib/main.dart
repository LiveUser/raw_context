import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: RawContext(
            textColor: Colors.white,
            contextMenuColor: Colors.lightBlue.shade700,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 60,
              ),
            ),
            items: [RawContextItem(onPressed: (){
              print('I am sexy');
            }, optionText: 'Delete')],
          ),
        ),
      ),
    ),
  );
}

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
  Widget child;
  RawContext({@required this.items,this.iconColor,this.contextMenuColor,this.textColor,this.iconSize,this.textSize,this.font,this.child});
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
