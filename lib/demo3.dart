import 'package:flutter/material.dart';

void main() => runApp(new DemoApp());

class DemoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "我是demo3",
      theme: new ThemeData(
        primaryColor: Colors.lime
      ),
      home: new DemoStatefulWidget(),
    );
  }
}
class DemoStatefulWidget extends StatefulWidget{
  @override
  DemoState createState() => new DemoState();
}
class DemoState extends State<DemoStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // 该ratings变量创建一个包含5个星形图标和一个文本的行
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),

      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star_border, color: Colors.black),
              new Icon(Icons.star_border, color: Colors.black),
            ],
          ),
          new Text(
            '170 reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );

    // 创建一个默认的文本样式
    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 20.0,
    );

    // 三列同种摆设的自定义widgets（一图标两文本），封装一个函数以便调用
    Column iconAndText(IconData icon, String text1, String text2){
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.green[500],),
          new Text(text1),
          new Text(text2)
        ],
      );
    }

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    // 所有的子节点继承
    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              iconAndText(Icons.kitchen, "PREP:", "25 min"),
              iconAndText(Icons.timer, 'COOK:', '1 hr'),
              iconAndText(Icons.restaurant, 'FEEDS:', '4-6')
            ],
          ),
        )
    );

    return new Scaffold(
      appBar: new AppBar(
          title: new Row(
            children: <Widget>[
              new Expanded(
                  flex: 1,
                  child: new Icon(Icons.add)
              ),
              new Expanded(
                  flex: 6,
                  child: new Center(child: new Text("标题三：我是demo3"),)
              ),
              new Expanded(
                  flex: 1,
                  child: new Icon(Icons.list)
              )
            ],
          )
        ),
      body: new ListView(
        children: <Widget>[
          ratings,
          new Card(
            margin: new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            color: Colors.orangeAccent,
            elevation: 5.0,
            child: iconList
          ),
        ],
      ),
    );
  }
}