import 'package:flutter/material.dart';

import 'bezier_spline_wave_form_home.dart';

void main() => runApp(BezierSplineWaveFormStart());

class BezierSplineWaveFormStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bezier spline wave form",
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: BezierSplineWaveFormHome(),
    );
  }
}
