# Raw Context

Easy context menu creation with flutter to speed up development. (A wrapper on Flutter's popup menu). 

Note: Opening the popup menu with the keyboard open will throw an error on your app. Its a flutter error so ensure that you close before allowing the user to tap on this context menu.

~~~dart
RawContext();//Widget with the menu icon and the context menu functionality
~~~

### Parameters for RawContext() Widget:

~~~dart
List<RawContextItem> items = [];//Clickable context menu options
Color iconColor = Colors.black;
Color contextMenuColor = Colors.white;
Color textColor = Colors.black;
double iconSize;
double textSize;
String font; //Font family String
Widget child; //A flutter widget/Icon to be used to launch the context menu when clicked if you don't want the default icon to be used.
~~~

Full Example:

~~~dart
import 'package:flutter/material.dart';
import 'package:raw_context/raw_context.dart';

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
            items: [
            RawContextItem(
              onPressed: (){
                print('I am sexy');
              },
              item: Text("Click Me")),
            ],
          ),
        ),
      ),
    ),
  );
}
~~~

Hecho en 🇵🇷 por Radamés J. Valentín Reyes