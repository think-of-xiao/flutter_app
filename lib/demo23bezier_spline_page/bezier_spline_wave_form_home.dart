import 'package:flutter/material.dart';

class BezierSplineWaveFormHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BezierSplineWaveFormState();
  }
}

class BezierSplineWaveFormState extends State<BezierSplineWaveFormHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("bezier spline wave form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           ClipPath(
             clipper: WaveFormClipper(),
             child: Container(
               height: 200.0,
               color: Colors.brown,
             ),
           )
          ],
        ),
      ),
    );
  }
}

class WaveFormClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path mPath = new Path();
    mPath.lineTo(0, 0);
    mPath.lineTo(0, size.height - 20);

    var firstControlPoint = Offset(size.width/4, size.height);
    var endControlPoint = Offset(size.width/2.25, size.height - 30);
    mPath.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, endControlPoint.dx, endControlPoint.dy);

    var firstControlPoint1 = Offset(size.width/4*3, size.height - 80);
    var endControlPoint1 = Offset(size.width, size.height - 40);
    mPath.quadraticBezierTo(firstControlPoint1.dx, firstControlPoint1.dy, endControlPoint1.dx, endControlPoint1.dy);

    mPath.lineTo(size.width, size.height - 40);
    mPath.lineTo(size.width, 0);
    return mPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}