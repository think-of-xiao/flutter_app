import 'package:flutter/material.dart';
import 'package:flutter_app/demo21wropdemo/warp_demo_show_page.dart';

void main() => runApp(new WropDemoStartPage());

class WropDemoStartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "warp demo",
      theme: ThemeData.dark(),
      home: WarpDemoShowPage(),
    );
  }
}