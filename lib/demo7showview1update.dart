import 'package:flutter/material.dart';

void main() => runApp(new Demo7ShowView1Update());

class Demo7ShowView1Update extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "我是demo7",
      theme: new ThemeData(
        primaryColor: Colors.lime
      ),
      home: new Demo7StatefulWidget(),
    );
  }
}
class Demo7StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo7State();
  }
}
class Demo7State extends State<Demo7StatefulWidget>{

  bool toggle = true;
  void _toggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild(){
    if(toggle)
      return new Text("Toggle one");
    else
      return new MaterialButton(onPressed: ()=>{}, child: new Text("Toggle two"),);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("我是demo7"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: "Update Text",
        child: new Icon(Icons.update),
      ),
    );
  }
}