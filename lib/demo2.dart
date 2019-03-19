import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new DomeApp());

class DomeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "我是demo",
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new DomeStatefulWidget(),
    );
  }
}
class DomeStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new DomeState();
}
class DomeState extends State<DomeStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget _titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "Oeschinen Lake Campground",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  "Kandersteg, Switzerland",
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text("41"),
        ],
      ),
    );

    Column _buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color,),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color
              ),
            ),
          )
        ],
      );
    }

    Widget _buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(Icons.call, "Call"),
          _buildButtonColumn(Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Icons.share, 'SHARE')
        ],
      ),
    );

    Widget _textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text("我是你爷爷flutter"),
        ),
      ),
      body: new ListView(
          children: <Widget>[
            new Image.asset("assets/banner.png", height: 200.0, fit: BoxFit.fill, ),
            _titleSection,
            _buttonSection,
            _textSection
          ],
      ),
    );
  }
}
