import 'package:flutter/material.dart';

void main() => runApp(new PageScreen());

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PageScreen'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('number three'),
      ),
    );
  }
}
