import 'package:flutter/material.dart';

void main() => runApp(new Demo4App());

class Demo4App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "我是demo4",
      theme: new ThemeData(
        primaryColor: Colors.green
      ),
      home: new Demo4StatefulWidget(),
    );
  }
}
class Demo4StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo4State();
  }
}
class Demo4State extends State<Demo4StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // 网格布局中的item项数据
    List<Container> _buildGridTileList(int count){
      return new List<Container>.generate(
          count,
          (int index) => new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/repayment_model_bg4.png"), fit: BoxFit.fill),
                  borderRadius: new BorderRadius.all(Radius.circular(3.0)),
                  border: new Border.all(color: Colors.blue, width: 1.0)
                ),
                child: new Center(child: new ListTile(
                  enabled: true,
                  title: new Text("我是内容", style: new TextStyle(fontSize: 12.0, color: Colors.white),),
                  trailing: new Image.asset("assets/fx_mingxi.png", color: Colors.white, width: 25.0, height: 25.0,),
                  ),
                )
          )
      );
    }

    // 创建网格布局gridview
    Widget buildGrid(){
      return new Center(
        child: new GridView.extent(
          maxCrossAxisExtent: 150.0,
          padding: new EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _buildGridTileList(30),
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("我是demo4"),),
      ),
      body: buildGrid(),
    );
  }
}