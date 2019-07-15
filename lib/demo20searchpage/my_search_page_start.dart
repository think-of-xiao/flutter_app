import 'package:flutter/material.dart';

import 'my_searchbar_demo.dart';

void main() => runApp(StartSearchApp());

class StartSearchApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.grey,
      title: "强大的搜索框",
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: true,
      home: SearchBarDemo(),
    );
  }
}