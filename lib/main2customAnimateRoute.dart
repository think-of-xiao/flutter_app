import 'package:flutter/material.dart';
import 'package:flutter_app/main2RoutePages/FirstPage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:new FirstPage()
    );
  }
}