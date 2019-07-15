import 'package:flutter/material.dart';

import 'frosted_glass_demo.dart';

void main() => runApp(new StartPage());

class StartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "毛玻璃效果",
      color: Colors.green,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(body: FrostedGlassDemo(),),
    );
  }
}