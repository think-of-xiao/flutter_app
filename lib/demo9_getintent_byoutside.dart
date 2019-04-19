import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Demo9App());

/// 从外部应用传入的参数在flutter中接收，需配合activity做相应的操作
class Demo9App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "wo shi demo9",
      theme: new ThemeData(
        primaryColor: Colors.brown[200]
      ),
      home: new Demo9StatefulWidget(),
    );
  }
}

class Demo9StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo9State();
  }
}

class Demo9State extends State<Demo9StatefulWidget>{
  static const platForm = MethodChannel("app.channel.shared.data");
  String dataShared = "No data";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化状态的时候就加入
    getSharedText();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("wo shi demo9"),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightGreen,
      body: new Center(child: new Text(dataShared, style: new TextStyle(fontSize: 24.0, color: Colors.red[400]),),),
    );
  }

  void getSharedText() async {
    var sharedData = await platForm.invokeMethod("getSharedText");
    if(sharedData != null){
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}