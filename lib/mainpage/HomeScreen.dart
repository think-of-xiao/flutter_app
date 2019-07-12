import 'package:flutter/material.dart';

void main() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
      title: new Text('HomeScreen'),
      centerTitle: true,
    ),
    body: new Center(
    child: new Text('number one'),
    ),
    );
  }
}
