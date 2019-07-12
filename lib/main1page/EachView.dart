import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  final String _title;

  EachView(this._title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EachViewState();
  }
}

class EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget._title),
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}
