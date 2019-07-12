import 'package:flutter/material.dart';

void main() => runApp(new EmailScreen());

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('EmailScreen'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('number two'),
      ),
    );
  }
}
