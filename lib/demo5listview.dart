import 'package:flutter/material.dart';

void main() => runApp(new Demo5ListView());

class Demo5ListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "我是demo5ListView",
      theme: new ThemeData(
        primaryColor: Colors.black
      ),
      home: new Demo5StatefulWidget(),
    );
  }
}
class Demo5StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo5State();
  }
}
class Demo5State extends State<Demo5StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> list = <Widget>[
      new ListTile(
        title: new Text("CineArts at the Empire",
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
        leading: new Icon(Icons.theaters, color: Colors.blue[500],),
        subtitle: new Text('85 W Portal Ave'),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.local_cafe,
          color: Colors.blue[500],
        ),
      )
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我是demo5Listview"),
        primary: true,
        leading: new Image.asset("assets/fx_mingxi.png", color: Colors.white, fit: BoxFit.contain,),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}