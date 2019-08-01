import 'package:flutter/material.dart';
import 'package:flutter_app/demo26tool_tip_page/tool_tip_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      title: "tool tip demo",
      home: ToolTipDemo(),
    );
  }
}