import 'package:flutter/material.dart';

import 'expansion_show_page.dart';

void main() => runApp(ExpansionStartApp());

class ExpansionStartApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "expansion demo",
      theme: ThemeData.dark(),
      home: ExpansionShowPage(),
    );
  }
}