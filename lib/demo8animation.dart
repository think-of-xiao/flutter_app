import 'package:flutter/material.dart';

void main() => runApp(new AnimationDemo());

class AnimationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "i am animation demo",
      theme: new ThemeData(
        primaryColor: Colors.teal
      ),
      home: new AnimationDemoStatefulWidget(title: "i am animation demo"),
    );
  }
}
class AnimationDemoStatefulWidget extends StatefulWidget{

  AnimationDemoStatefulWidget({Key key, this.title}) : super(key:key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationDemoState();
  }
}
class AnimationDemoState extends State<AnimationDemoStatefulWidget> with TickerProviderStateMixin{

  AnimationController mController;
  CurvedAnimation mCurved;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    mCurved = new CurvedAnimation(parent: mController, curve: Curves.easeIn);
  }

  void _floatPressed(){
    mController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new ListTile(
          title: new Text(widget.title),
          selected: true,
          subtitle: new Text("我是动画demo"),),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: mCurved,
            child: new Image.asset("assets/repayment_model_bg4.png"),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _floatPressed,
        tooltip: "i am floatButton",
        child: new Icon(Icons.adb),
      ),
    );
  }
}