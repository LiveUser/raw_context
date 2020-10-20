// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:raw_context/main.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: RawContext(
            textColor: Colors.white,
            contextMenuColor: Colors.lightBlue.shade700,
            iconColor: Colors.orange,
            iconSize: 50,
            items: [RawContextItem(onPressed: (){
              print('I am sexy');
            }, optionText: 'Delete')],
          ),
        ),
      ),
    ),
  );
}
