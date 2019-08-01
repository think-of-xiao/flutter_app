import 'package:flutter/material.dart';
import 'package:flutter_app/demo27graggable_page/draggable_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "draggable demo",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: DraggableDemo(),
    );
  }
}