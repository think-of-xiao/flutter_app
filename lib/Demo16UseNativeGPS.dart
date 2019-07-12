import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';

void main() => runApp(new Demo16Stateless());

class Demo16Stateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "i am demo 16",
      theme: ThemeData(primaryColor: Colors.lightGreen),
      debugShowCheckedModeBanner: true,
      home: new Demo16Stateful(),
    );
  }
}

class Demo16Stateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo16State();
  }
}

class Demo16State extends State<Demo16Stateful> {
  static const platForm = MethodChannel("samples.flutter.io/gps");
  String _message;

  /// 检测GPS
  void _inspection() async {
    String message;
    message = await platForm.invokeMethod("inspectionGPS");
    setState(() {
      _message = message;
    });
  }

  void _open() async {
    await platForm.invokeMethod("openGPS");
  }

  void _getData() async {
    await platForm.invokeMethod("getDate");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: new Text("flutter中使用GPS导航"),
        titleSpacing: 0.3,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("GPS状态：$_message")],
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('检查GPS状态'),
                    onPressed: _inspection,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('开关GPS'),
                    onPressed: _open,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('获取经纬度'),
                    onPressed: _getData,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
