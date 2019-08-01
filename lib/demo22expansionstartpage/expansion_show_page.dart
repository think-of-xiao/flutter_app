import 'package:flutter/material.dart';

class ExpansionShowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpansionShowPageState();
  }
}

class ExpansionShowPageState extends State<ExpansionShowPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("展开闭合控件Expansion Widget"),
        centerTitle: true,
      ),
      body: Center(
        child: ExpansionTile(
          title: Text("我是辩题"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text("我是展开部分标题"),
              subtitle: Text("我是明细"),
            )
          ],
          initiallyExpanded: false,
        ),
      ),
    );
  }
}
