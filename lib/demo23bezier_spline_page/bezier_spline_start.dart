import 'package:flutter/material.dart';

import 'bezier_spline_home.dart';

void main() => runApp(new BezierSplineStartPage());

class BezierSplineStartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "bezier spline start",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: BezierSplineHomePage(),
    );
  }
}