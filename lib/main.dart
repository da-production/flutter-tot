import 'package:flutter/material.dart';
import 'package:tot/pages/homePage.dart';
import 'package:tot/pages/todo-page.dart';

void main() => runApp(TotApp());

class TotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tot',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'todo-page': (context){
          return TodoPage();
        }
      },
    );
  }
}
