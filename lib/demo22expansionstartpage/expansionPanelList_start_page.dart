import 'package:flutter/material.dart';

import 'expansionPanelList_show_page.dart';

void main() => runApp(new ExpansionPanelListStartPage());

class ExpansionPanelListStartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "ExpansionPanelList Widget",
      theme: ThemeData.dark(),
      home: ExpansionPanelListShowWidget(),
    );
  }
}