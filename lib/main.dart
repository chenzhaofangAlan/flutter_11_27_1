import 'package:flutter/material.dart';
import 'package:flutter_11_27_1/page/loginPage.dart';
import 'package:flutter_11_27_1/page/homePage.dart';

void main() => runApp(
    MaterialApp(
      home: loginPage(),
      routes: <String, WidgetBuilder> {
        '/homePage':(context) => new MyHomePage(),
        '/loginPage':(context) => new loginPage()
      },
    )
);






