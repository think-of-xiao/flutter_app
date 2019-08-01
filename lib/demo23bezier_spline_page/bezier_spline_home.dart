import 'package:flutter/material.dart';

class BezierSplineHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BezierSplineHomeState();
  }
}

class BezierSplineHomeState extends State<BezierSplineHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier spline Demo"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.blue,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0); // 第一段线的起始点
    path.lineTo(0, size.height - 100); // 第一段线的终点
    var firstControlPoint = Offset(size.width/2, size.height); // 设置塞尔曲线的起始节点
    var firstEndPoint = Offset(size.width, size.height - 100); // 设置贝塞尔曲线的结束节点

    // 设置贝塞尔曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 100); // 第二段线的起始点
    path.lineTo(size.width, 0); // 第二段线的终点
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
