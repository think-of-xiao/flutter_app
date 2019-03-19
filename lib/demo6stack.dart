import 'package:flutter/material.dart';

void main() => runApp(new Demo6StackApp());

class Demo6StackApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "i am demo6stack home",
      theme: new ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: new Demo6StackStatefulWidget(),
    );
  }
}
class Demo6StackStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo6StackState();
  }
}
class Demo6StackState extends State<Demo6StackStatefulWidget>{

  double height = 100.0;

  void _updateCardHeight(){
    setState(() {
      height+=10.0;
      if(height >210.0)
        height = 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // 使用Stack叠加Container（在半透明的黑色背景上显示其文本），
    // 放置在Circle Avatar的顶部。Stack使用alignment属性和调整文本偏移。
    // 使用Stack将gradient叠加到图像的顶部。gradient确保工具栏的图标与图片不同。
    var stack = new Stack(
      alignment: new AlignmentDirectional(0.6, 0.6),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("assets/repayment_model_bg4.png"),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    // 包含3个ListTiles并通过用SizedBox包装进行大小调整的Card。分隔线分隔第一个和第二个ListTiles。
    var card = new SizedBox(
      height: height,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text("1625 Main Street", style: new TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text("My City, CA 99984"),
              leading: new Icon(Icons.restaurant_menu, color: Colors.blue[500],),
            ),
            new Divider(),
            new ListTile(
              title: new Text("(408) 555-1212", style: new TextStyle(fontWeight: FontWeight.w500),),
              leading: new Icon(Icons.contact_phone, color: Colors.blue[500],),
            ),
            new ListTile(
              title: new Text("costa@example.com",),
              leading: new Icon(Icons.contact_mail, color: Colors.blue[500],),
            )
          ],
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("i am demo6stack home")
      ),
      body: new ListView(
            padding: new EdgeInsets.all(15.0),
            children: <Widget>[
              new Center(
                  child: stack
              ),
              card,
              new Center(
                child: new MaterialButton(
                  onPressed: () {},
                  child: new Text('Hello'),
                  padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                ),
              ),
            ],
          ),
      floatingActionButton: new FloatingActionButton(
      onPressed: _updateCardHeight,
      tooltip: "update card height",
      child: new Icon(Icons.update),
      ),
    );
  }
}