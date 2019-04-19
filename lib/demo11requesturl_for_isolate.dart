import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/publicInfos/Strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:isolate';

void main() => runApp(new Demo11RequestUrlForIsolate());

class Demo11RequestUrlForIsolate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.welcomeMessage,
      theme: new ThemeData(primaryColor: Colors.teal),
      home: new Demo11StatefulWidget(),
    );
  }
}
class Demo11StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo11State();
  }
}
class Demo11State extends State<Demo11StatefulWidget>{

  /// 存放数据的list集合
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  /// 是否显示等待弹窗
  bool showLoadingDialog(){
    if(widgets.length == 0){
      return true;
    }
    return false;
  }

  /// 显示加载弹框
  Widget getProgressDialog(){
    return new Center(child: new CircularProgressIndicator(),);
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position){
        return getRow(position);
      });

  Widget getRow(int i){
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["body"]}"),);
  }
  
  Widget getBody(){
    if(showLoadingDialog()){
      return getProgressDialog();
    }
    return getListView();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("wo shi demo11 for isolate"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  /// 初始化界面之后进行一个数据加载
  loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // 'echo'发送的第一个message，是它的SendPort
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");
    print("-------" + msg.toString());
    setState(() {
      widgets = msg;
    });
  }
  /// 新isolate的入口函数
  static dataLoader(SendPort sendPort) async {
    // 实例化一个ReceivePort 以接收消息
    ReceivePort port = new ReceivePort();
    // 把它的sendPort发送给宿主isolate，以便宿主可以给它发送消息
    sendPort.send(port.sendPort);
    // 监听消息
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(json.decode(response.body));
    }
  }
  /// 对某个port发送消息，并接收结果
  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}