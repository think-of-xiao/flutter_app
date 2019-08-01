import 'package:flutter/material.dart';

import 'right_back_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "right back demo",
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: RightBackDemo(),
    );
  }
}