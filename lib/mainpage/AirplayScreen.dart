import 'package:flutter/material.dart';

void main() => runApp(new AirplayScreen());

class AirplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AirplayScreen'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('number four'),
      ),
    );
  }
}
