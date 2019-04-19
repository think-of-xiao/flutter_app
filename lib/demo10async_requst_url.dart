import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:isolate';

void main() => runApp(new Demo10RequestUrlApp());

class Demo10RequestUrlApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "wo shi demo10 for request url",
      theme: new ThemeData(
        primaryColor: Colors.orangeAccent
      ),
      home: new Demo10StatefulWidget(),
    );
  }
}
class Demo10StatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo10State();
  }
}
class Demo10State extends State<Demo10StatefulWidget>{

  List widgetsStr = [];

  loadData() async {
    String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgetsStr = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("wo shi demo10 for request url"),
        centerTitle: true,
      ),
      drawer: new Center(child: new Text("wo shi drawer widget", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.deepOrangeAccent[100],
      body: new ListView.builder(
          itemCount: widgetsStr.length,
          itemBuilder: (BuildContext context, int position){
            return getRow(position);
          }),
    );
  }

  Widget getRow(int position) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgetsStr[position]["title"]}"),);
  }
}